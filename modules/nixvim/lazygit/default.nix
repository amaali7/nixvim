{ helpers, ... }: {
  plugins.lazygit = {
		enable = true;
		settings = {
			floating_window_scaling_factor = 0.9;
  floating_window_use_plenary = false;
  floating_window_winblend = 0;
  use_custom_config_file_path = false;
  use_neovim_remote = true;
			floating_window_border_chars = [
  "╭"
  "─"
  "╮"
  "│"
  "╯"
  "─"
  "╰"
  "│"
];

};
	};
}
