function is_git_repo -d "Check if directory is a repository"
    command git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null
end

function is_git_dirty -d "Check if repo has any changes"
    test -n (echo (command git status --porcelain))
end

function git_branch_name -d "Get current branch name"
    command git describe --tags --exact-match ^ /dev/null;
        or command git symbolic-ref --short HEAD ^ /dev/null;
        or command git rev-parse --short HEAD ^ /dev/null
end

function fish_right_prompt
    if is_git_repo
        set -l repo_name (git_branch_name)
        if is_git_dirty
            set_color -b red
        else
            set_color -b cyan
        end
        set_color white
        echo " $repo_name "
        set_color normal
    end
end