function fish_prompt
    set -l last_command_status $status

    set -l fish "⋊>"

    set -l normal_color     (set_color normal)
    set -l success_color    (set_color cyan)
    set -l error_color      (set_color red)
    set -l path_color       (set_color blue)
    set -l venv_color       (set_color green)

    if set -q VIRTUAL_ENV
        # set -l venv_name (basename "$VIRTUAL_ENV")
        # echo -n -s $venv_color "[$venv_name] "
        echo -n -s $venv_color "[venv] "
    end

    echo -n -s $path_color (prompt_pwd)" "

    if test $last_command_status -eq 0
        echo -n -s $success_color $fish $normal_color
    else
        echo -n -s $error_color $fish $normal_color
    end

    echo -n -s " "
end
