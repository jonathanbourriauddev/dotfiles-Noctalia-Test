 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1f23',
    base01 = '#2b343b',
    base02 = '#272f35',
    base03 = '#606a70',
    base04 = '#afb3b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#9266cc',
    base0A = '#5c66d6',
    base0B = '#67afe4',
    base0C = '#ba96e9',
    base0D = '#93c6ec',
    base0E = '#969de9',
    base0F = '#bec2f4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1f23' })
  hi('TelescopeBorder',         { fg = '#606a70',             bg = '#1a1f23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1f23' })
  hi('TelescopePromptBorder',   { fg = '#606a70',             bg = '#1a1f23' })
  hi('TelescopePromptPrefix',   { fg = '#67afe4',             bg = '#1a1f23' })
  hi('TelescopePromptCounter',  { fg = '#afb3b6',  bg = '#1a1f23' })
  hi('TelescopePromptTitle',    { fg = '#1a1f23',             bg = '#67afe4' })
  hi('TelescopePreviewTitle',   { fg = '#1a1f23',             bg = '#5c66d6' })
  hi('TelescopeResultsTitle',   { fg = '#1a1f23',             bg = '#9266cc' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#272f35' })
  hi('TelescopeSelectionCaret', { fg = '#67afe4',             bg = '#272f35' })
  hi('TelescopeMatching',       { fg = '#67afe4',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#1a1f23' })
  hi('MiniPickBorder',         { fg = '#606a70',             bg = '#1a1f23' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#1a1f23' })
  hi('MiniPickPromptPrefix',   { fg = '#67afe4',             bg = '#1a1f23' })
  hi('MiniPickBorderText',    { fg = '#1a1f23',             bg = '#67afe4' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#272f35' })
  hi('MiniPickPromptCaret', { fg = '#67afe4',             bg = '#272f35' })
  hi('MiniPickMatchRanges',       { fg = '#67afe4',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
