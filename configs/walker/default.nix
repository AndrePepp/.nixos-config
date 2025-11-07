{
  config,
  pkgs,
  lib,
  ...
}:  {

programs.walker = {

	enable = true;
	runAsService = true;

config = {

	force_keyboard_focus = true;
	close_when_open = true;
	click_to_close = false;
	selection_warp = false;
	global_argument_delimiter = "#";
	exact_search_prefix = "'";
	theme = "default";
	disable_mouse = true;
	debug = false;
	page_jump_items = 10;
	hide_quick_activation = false;


	keybinds = {

	close = ["Escape"];
	next = ["Down" ]; 
	previous = ["Up" ];
	toggle_exact = ["ctrl e"];
	resume_last_query = ["shift ctrl"];
	quick_activate = ["Enter"];
	page_down = ["Page_Down"];
	page_up = ["Page_Up"];

	};

};

};
}
