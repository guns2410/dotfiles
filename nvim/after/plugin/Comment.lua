require("Comment").setup({
   padding = true,
   sticky = true,
   toggler = {
      line = "<leader>cc",
      block = "<leader>cb",
   },
   opleader = {
       line = "<leader>c",
       block = "<leader>cb",
   },
   extra = {
        above = "<leader>cO",
        below = "<leader>co",
        eol = "<leader>cA",
   }
})
