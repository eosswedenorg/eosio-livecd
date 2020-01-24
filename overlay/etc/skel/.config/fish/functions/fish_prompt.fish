function fish_prompt
	echo -n "$USER/"
	set_color $fish_color_host
	echo -n (hostname)
	set_color normal
	echo -n " "
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal
	echo -n "> "
end

