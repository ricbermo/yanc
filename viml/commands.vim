"automatically run :PackerCompile whenever plugins.lua is updated
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

"automatically run tests on save
augroup UltestRunner
  au!
  au BufWritePost * Ultest
augroup END

