export PATH="/usr/local/share/python:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$PROJECTS

export DEVELOPMENT=

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

eval "`/usr/local/bin/pip completion --zsh `"