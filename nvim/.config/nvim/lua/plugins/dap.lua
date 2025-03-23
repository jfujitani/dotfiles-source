return {
  {
    "mfussenegger/nvim-dap",
    keys = {
        { "<f5>", function() require("dap").continue() end, desc = "continue", },
        { "<C-f5>", function() require("dap").terminate() end, desc = "terminate", },
        { "<f10>", function() require("dap").step_over() end, desc = "step over", },
        { "<f11>", function() require("dap").step_into() end, desc = "step into", },
        { "<f12>", function() require("dap").step_out() end, desc = "step out", },
    },
  },
}
