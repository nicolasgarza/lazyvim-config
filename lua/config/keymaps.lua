-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- Function to toggle comments
local function toggle_comment()
  local line = vim.api.nvim_get_current_line()
  local is_commented = line:match("^%s*//")

  if is_commented then
    -- Uncomment the line
    local new_line = line:gsub("^%s*//%s?", "") -- Ensure we get a non-nil result
    if new_line then -- Check if new_line is not nil
      vim.api.nvim_set_current_line(new_line)
    end
  else
    -- Comment the line
    vim.api.nvim_set_current_line("// " .. line)
  end
end

-- Map Ctrl-/ to toggle comments in normal mode
vim.keymap.set("n", "<C-_>", toggle_comment, { noremap = true, silent = true, desc = "Toggle Comment" })

-- Map Ctrl-/ to toggle comments in visual mode
vim.keymap.set("v", "<C-_>", function()
  -- Execute for each line in the visual selection
  local line1, line2 = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  for line = line1, line2 do
    local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]
    local is_commented = current_line:match("^%s*//")
    if is_commented then
      -- Uncomment the line
      local new_current_line = current_line:gsub("^%s*//%s?", "")
      if new_current_line then -- Check if new_current_line is not nil
        vim.api.nvim_buf_set_lines(0, line - 1, line, false, { new_current_line })
      end
    else
      -- Comment the line
      vim.api.nvim_buf_set_lines(0, line - 1, line, false, { "// " .. current_line })
    end
  end
end, { noremap = true, silent = true, desc = "Toggle Comment Visual" })
