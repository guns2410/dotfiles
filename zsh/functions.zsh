soql () {
	export SF_ORG_MAX_QUERY_LIMIT=10000000
	if [ "$1" = "" ]
	then
		echo "Query required"
		return
	fi
	if [ "$2" = "copy" ]
	then
		sf data query -q "$1" --target-org prod -r json | jq ".result.records" | json2csv --flatten-objects | pbcopy
		return
	fi
	FMT=${2:-human}
	sf data query -q "$1" --target-org prod -r json| perl -pe 's/\e\[[0-9;]*m(?:\e\[K)?//g' | jq ".result.records"
}

apextail () {
	ENV=${1:-prod}
	echo "Tailing sfdx: $ENV"
       	sfdx force:apex:log:tail -u "$ENV"
}

mongoprod () {
    mongo "$MONGO_URL"
}

tunnel() {
	PS3="Select service: "
	select opt in entity-database image-search entity-api evidence proxy services proxy-service aws-dns additional-match-finder opensearch quit;
	do
		case $opt in
			entity-database)
				echo "entity-production.cluster-czfzyzjiasis.us-east-1.rds.amazonaws.com:5432 => 127.0.0.1:8888"
				while true; do ssh jobs -N -L 8888:entity-production.cluster-czfzyzjiasis.us-east-1.rds.amazonaws.com:5432; done;
				;;
			image-search)
				echo "image-search-production.asgard:3000 => localhost:3030"
				while true; do ssh jobs -N -L 3030:image-search-production.asgard:3000; done;
				;;
			entity-api)
				echo "entity-api-production.asgard:50051 => localhost:50051"
				while true; do ssh jobs -N -L 50051:entity-api-production.asgard:50051; done;
				;;
			evidence)
				echo "pixsy-evidence-production.asgard:4545 => localhost:4545"
				while true; do ssh jobs -N -L 4545:pixsy-evidence-production.asgard:4545; done;
				;;
			proxy)
				echo "proxy-production.asgard:1337 => localhost:1337"
				while true; do ssh jobs -N -L 1337:proxy-production.asgard:1337; done;
				;;
			services)
				echo "services.asgard => localhost:3003\nservices.asgard:1080 => localhost:1337\nus.proxy:1080 => localhost:1081\neu.proxy:1080 => localhost:1082\nother.proxy:1080 => localhost:1083\nStats => localhost:19999"
				while true; do ssh jobs -N -L 19999:services.asgard:19999 -L 3003:services.asgard:80 -L 1081:services.asgard:1081 -L 1337:services.asgard:1080 -L 1082:services.asgard:1082 -L 1083:services.asgard:1083; done;
				;;
			proxy-service)
				echo "proxy-us.asgard:1080 => localhost:1337"
				while true; do ssh jobs -N -L 1337:proxy-us.asgard:1080; done;
				;;
			aws-dns)
				echo "10.0.0.2:53 => 127.0.0.1:1053"
				while true; do ssh jobs -N -L 127.0.0.1:1053:10.0.0.2:53; done;
				;;
			additional-match-finder)
				echo "additional-match-finder:8080 => localhost:8080"
				while true; do ssh jobs -N -L 8080:additional-match-finder:8080; done;
				;;
			opensearch)
				echo "vpc-phash-proximity-yf2hnar5bgwgmnl2bdu5kowk4q.us-east-1.es.amazonaws.com:443 => localhost:8899"
				while true; do ssh jobs -N -L 8899:vpc-phash-proximity-yf2hnar5bgwgmnl2bdu5kowk4q.us-east-1.es.amazonaws.com:443; done;
				;;
			quit)
				break
				;;
			*) echo "invalid option $REPLY";;
		esac
	done
}

logs () {
	PS3="Select service: "
	select opt in webapp spiders graph evidence image-search entity-api image-sim proxy brahma brahma2 quit;
	do
		case $opt in
			webapp)
				cw tail -f /ecs/pixsy-webapp-asgard
				;;
			spiders)
				cw tail -f /ecs/pixsy-spider
				;;
			graph)
				cw tail -f /ecs/pixsy-graph-production
				;;
			evidence)
				cw tail -f /ecs/pixsy-evidence-production
				;;
			image-search)
				cw tail -f /ecs/pixsy-image-search-production
				;;
			entity-api)
				cw tail -f /ecs/entity-api-production
				;;
			image-sim)
				cw tail -f /ecs/image-sim-consumer-production
				;;
			proxy)
				cw tail -f /ecs/proxy-production
				;;
			brahma)
				cw tail -f /ecs/brahma-production
				;;
			brahma2)
				cw tail -f /ecs/brahma-2
				;;
			quit)
				break
				;;
			*) echo "invalid option $REPLY";;
		esac
	done
}

thermal() {
	pmset -g thermlog
}
