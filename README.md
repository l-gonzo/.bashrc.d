# Custom Bash Configuration

The intent of this project is to customize the GNOME terminal without using external tools or pre-configurations, focusing on manual customization of appearance and functionality.

This repository contains a custom Bash configuration that improves the user experience by customizing the prompt, defining aliases, and useful functions for file management.

## Contents

1. **.bashrc.d/**: Directory containing additional scripts that are automatically loaded at Bash startup.
2. **Custom Functions**: Various functions that improve usability, including displaying directories and files with icons.
   `.bashrc`: Main configuration file for the Bash shell. (not included in this repository, as it comes by default on your system)
contents of .bashrc:
```bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
## Installation

1. **Verify the existence of the `.bashrc` file (if it doesn't exist, create it with the code provided above) in your home directory**:
```bash
cat ~/.bashrc
```

2. **Clone the repository to the indicated directory**:
```bash
cd ~/

git clone https://github.com/l-gonzo/.bashrc.d.git
```

3. **Add any additional scripts in the `.bashrc.d` directory** that you want to load automatically when Bash starts.

4. **Restart the terminal** or run `source ~/.bashrc` to apply the changes.

## Features

### Prompt Customization

The Bash prompt is customized to display:
- The user name
- The host name
- The current directory
- The current Git branch (if you are in a Git repository)
- The name of the virtual environment (if active)

### Colors and Style

ANSI colors are used for readability:
- **User**: White
- **Host**: Blood Red
- **Directory**: Deep Cyan
- **Git Branch**: Purple
- **Virtual Environment**: Green

### Custom Functions

- **get_git_branch**: Returns the current Git branch if you are inside a repository.
- **get_virtual_env**: Displays the name of the active virtual environment.

### File Listing with Icons

The `ls_with_icons` function replaces the `ls` command to provide a more visual file listing:
- Icons are displayed next to file and folder names.
- Information about the owner and permissions of the files is included.

### Aliases

- An `ls` alias is set that uses the `ls_with_icons` function.

## Usage Example

After installation, simply open a new terminal and you will be able to see your new custom prompt. When you run `ls`, you will see a file listing with icons and additional details.

## Results
![image](https://github.com/user-attachments/assets/fee422e8-18cb-4795-9c7f-305a427be3ab)


## Contributions

If you wish to contribute to this setup, feel free to fork the repository and submit your improvements via a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
