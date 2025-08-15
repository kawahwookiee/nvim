return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup({
      -- Providers must be explicitly set up to make them available.
      providers = {
        openai = {
          name = "openai",
          endpoint = "https://api.openai.com/v1/chat/completions",
          -- endpoint to query the available models online
          model_endpoint = "https://api.openai.com/v1/models",
          api_key = os.getenv("OPENAI_API_KEY"),
          headers = function(self)
            return {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer " .. self.api_key,
            }
          end,
          models = {
            "gpt-5",
            "gpt-5-mini",
            "gpt-5-nano",
          },
        },
        gemini = {
          api_key = os.getenv("GEMINI_API_KEY"),
          name = "gemini",
          endpoint = function(self)
            return "https://generativelanguage.googleapis.com/v1beta/models/"
              .. self._model
              .. ":streamGenerateContent?alt=sse"
          end,
          model_endpoint = function(self)
            return { "https://generativelanguage.googleapis.com/v1beta/models?key=" .. self.api_key }
          end,
          headers = function(self)
            return {
              ["Content-Type"] = "application/json",
              ["x-goog-api-key"] = self.api_key,
            }
          end,
          models = {
            "gemini-2.5-flash",
            "gemini-2.5-pro",
          },
        },
      },
    })
  end,
}
