# ZshDotfiles
Custom zsh profile with aliases and themes that I use

## Install

### Step 1: Install Zsh
```
sudo apt-get update
sudo apt-get install zsh
```

### Step 2: Create Projects directory and clone repo
```
mkdir ~/Projects
```
This is so all the the aliases will work
```
git clone git@github.com:garrettleising/ZshDotfiles.git ~/Projects/ZshDotfiles
```

### Step 3: Install ohyzsh if not already installed
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 4: Install personal themes and plugins
```
sh install.sh
```

### Step 5: Restart Zsh
```
exec zsh
```