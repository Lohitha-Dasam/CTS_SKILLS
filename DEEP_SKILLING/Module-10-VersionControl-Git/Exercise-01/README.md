# Exercise 01 - Git Configuration and Repository Initialization

## Objective

Configure Git and create a local Git repository.

## Tools Used

- Git
- Git Bash
- Visual Studio Code

## Commands Executed

```bash
git --version
git config --global --list
git config --global core.editor "code --wait"
mkdir GitDemo
cd GitDemo
git init
echo "Welcome to the version control" > welcome.txt
cat welcome.txt
git status
git add welcome.txt
git commit -m "Added welcome.txt"
git log
```

## Files Created

- GitDemo
- welcome.txt
- Outputs/Lab10_Exercise01_Output.txt

## Result

Successfully configured Git, initialized a local Git repository, created a file, staged it, committed it, and verified the commit history.