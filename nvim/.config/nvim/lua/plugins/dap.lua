return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<f9>", function() require("dap").toggle_breakpoint() end, desc = "continue", },
      { "<f5>", function() require("dap").continue() end, desc = "continue", },
      { "<S-f5>", function() require("dap").terminate() end, desc = "terminate", },
      { "<f10>", function() require("dap").step_over() end, desc = "step over", },
      { "<f11>", function() require("dap").step_into() end, desc = "step into", },
      { "<f12>", function() require("dap").step_out() end, desc = "step out", },
    },
  }
}
