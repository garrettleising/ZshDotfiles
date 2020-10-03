# ZshDotfiles
Custom zsh profile with aliases and themes that I use

## Install

### Step 1: Clone Repo
```
mkdir ~/Projects
```
This is so all the the aliases will work
```
git clone git@github.com:garrettleising/ZshDotfiles.git ~/Projects/ZshDotfiles
```

### Step 2: Install OhMyZsh if not already installed
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 3: Install personal themes and plugins for OhMyZsh
```
sh install.sh
```

### Step 4: Restart Zsh
```
exec zsh
```