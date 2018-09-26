function cd --description "Changes directory and activates virtual Python environment if exists"
    builtin cd $argv

    if test -e "$PWD/.venv/bin/activate.fish"
        source $PWD/.venv/bin/activate.fish
    end

    if test -n "$VIRTUAL_ENV" -a "$VIRTUAL_ENV" != "$PWD/.venv"
        deactivate
    end
end
