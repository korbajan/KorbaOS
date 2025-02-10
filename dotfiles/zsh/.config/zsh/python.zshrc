### PYTHON:

export PIP_INDEX_URL=http://localhost:8222

function pyenv_venv_activate() {
  pyenv deactivate 2>/dev/null
  venv_name=${PWD:t}
  pyenv activate $venv_name
}

function pyenv_venv_rebuild() {
  pyenv deactivate 2>/dev/null
  default_venv_name=${PWD:t}
  venv_name=${1:-$default_venv_name}
  pyenv uninstall -f ${venv_name} 2>/dev/null
  pyenv virtualenv ${venv_name}
  pyenv activate ${venv_name}
  # find -regextype posix-extended -regex '.*(requirements|requires)\.txt' | grep -v 'egg-info' | grep -v ansible | xargs -I req pip install -r req
  pip install --force-reinstall -e .
  if [ -f test-requirements.txt ]; then
    pip install -r test-requirements.txt
  fi
  pip install pytest pip-tools black python-lsp-server python-lsp-ruff python-lsp-black
}

alias flake8='flake8 --exclude *.egg-info | grep -v "./build" | grep -v "./migrations"'

alias create_venv="python -m venv .venv"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function greppy() {
  find -name "*.py" -not -path "*/.venv/*" -not -path "*/build/*" | xargs grep ${1} | fzf-tmux -p --reverse
}
