export PATH=$PATH:~/Library/Python/3.9/bin

alias python='python3'

export JAVA_HOME=~/Downloads/OpenJDK-21.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME

# venv time saving commands
export VENV_HOME=~/workspace/venv

create_venv() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: create_venv <venv_name>"
    return 1
  fi

  venv_path=$VENV_HOME/$1
  if [[ -d $venv_path ]]; then
    echo "\033[0;31mVirtual environment '$venv_path' already exists!\033[0m"
    return 1
  else
    python -m venv $venv_path
    echo "Virtual environment '$venv_path' created."
  fi
}

activate_venv() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: activate_venv <venv_name>"
    return 1
  fi

  venv_path=$VENV_HOME/$1
  venv_activate_path="$venv_path/bin/activate"

  if [[ -f "$venv_activate_path" ]]; then
    source "$venv_activate_path"
    echo "Virtual environment '$venv_path' activated."
  else
    echo "\033[0;31mVirtual environment '$venv_path' not found!\033[0m"
  fi
}

# custom global npm_modules directory
export PATH=~/.npm-global/bin:$PATH
