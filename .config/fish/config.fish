# set -x PYENV_ROOT ~/.pyenv
# set -x PATH ~/.pyenv/bin $PATH

# if status --is-interactive
#     source (pyenv init - | psub)
#     source (pyenv virtualenv-init - | psub)
# end

set -gx VIRTUAL_ENV_DISABLE_PROMPT false
