local telescope = prequire "telescope"
if not telescope then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      i = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
      n = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    menufacture = {
      mappings = {
        main_menu = { [{ "i", "n" }] = "<C-p>" },
      },
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "menufacture"
