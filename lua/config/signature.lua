local lspsignature = prequire("lsp_signature")
if not lspsignature then return end

lspsignature.setup {
  bind = false,
  use_lspsaga = true,
  doc_lines = 4,
  floating_window_above_cur_line = false,
  floating_window = true,
  hint_prefix = ' ',
  handler_opts = {
    border = 'single' -- double, single, shadow, none
  },
}
