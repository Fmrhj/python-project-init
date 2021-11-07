#/bin/bash

: '
2021-07-11

Basic structure based on $BASIC_DIRS and $MODULES. Change accordingly.

├── Makefile
├── Pipfile
├── README.md
├── bin
│   ├── __init__.py
│   ├── model
│       ├── __init__.py
│   ├── preprocessing
│       ├── __init__.py
│   ├── tests
│       ├── __init__.py
│   └── utils
│       ├── __init__.py
├── data
└── outputs
'

echo "Creating basic files and directories:"

BASIC_DIRS=(data outputs bin .vscode)
MODULES=(preprocessing model tests utils)

for dir in "${BASIC_DIRS[@]}"; do
    echo "/$dir"
    mkdir -p $dir
    if [ "$dir" = "bin" ]
    then
        touch "$dir/__init__.py"
        for sub_dir in "${MODULES[@]}"; do
            mkdir -p "$dir/$sub_dir"
            touch "$dir/$sub_dir/__init__.py"
        done
    fi
done

# Create Makefile
[[ -f Makefile ]] || touch Makefile

# Create README.md
[[ -f README.md ]] || touch README.md

# Download sort configuration
ISORT_CFG="https://raw.githubusercontent.com/Fmrhj/python-project-init/main/.isort.cfg"
ISORT_TARGET=".isort.cfg"
[[ -f $ISORT_TARGET ]] || curl -o $ISORT_TARGET $SETTINGS_URL &> /dev/null

# Create a vscode/settings.json file
SETTINGS_URL="https://gist.githubusercontent.com/Fmrhj/5f1ff5446b59c1ecc55d35271f14e69e/raw/0a88bb24e8f8ac8155a5e160c00c3a3a27967e6f/settings.json"
VSCODE_SETTINGS=".vscode/settings.json"
[[ -f $VSCODE_SETTINGS ]] || curl -o $VSCODE_SETTINGS $SETTINGS_URL &> /dev/null

# Initialize git
[ -d .git ] ||git init

# Create .gitignore
IGNORE_DIRS=(.vscode .venv data)

[[ -f .gitignore ]] || for dir in "${IGNORE_DIRS[@]}"; do
    echo "$dir" >> .gitignore
done

# Create Pipenv environment: it will create a local .venv due to the .vscode settings
pipenv shell

# Remove init file
rm -f init.sh

echo "Python Project initialized!"
