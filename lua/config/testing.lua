local g = vim.g

g.ultest_use_pty = 1
g.ultest_output_on_line = 0
g.ultest_fail_sign = ''
g.ultest_running_sign = ''
g.ultest_pass_sign = ''

g['test#strategy'] = "vimux"
g['test#preserve_screen'] = 0
g['test#javascript#jest#options'] = "--color=always"
