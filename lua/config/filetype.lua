vim.g.did_load_filetypes = 1

local filetype = prequire("filetype")
if not (filetype) then return end

filetype.setup({
  overrides = {
    literal = {
      Podfile = 'ruby',
    },
    complex = {
      ['.*git/config'] = 'gitconfig',
    },
  }
})
