#/bin/bash

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

SETTINGS_URL="https://gist.githubusercontent.com/Fmrhj/5f1ff5446b59c1ecc55d35271f14e69e/raw/0a88bb24e8f8ac8155a5e160c00c3a3a27967e6f/settings.json"

# Create a vscode/settings.json file
[[ -f .vscode/settings.json ]] || curl -o .vscode/settings.json $SETTINGS_URL &> /dev/null

# Initialize git
[ -d .git ] ||git init

# Create .gitignore
IGNORE_DIRS=(.vscode .venv data)

[[ -f .gitignore ]] || for dir in "${IGNORE_DIRS[@]}"; do
    echo "$dir" >> .gitignore
done

echo "Python Project initialized!"
