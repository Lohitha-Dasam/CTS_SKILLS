# Exercise 04 - Git Merge Conflict Resolution

## Objective

Learn how to resolve merge conflicts in Git.

## Tools Used

- Git
- Git Bash
- Visual Studio Code

## Commands Executed

```bash
git init
git branch GitWork
git checkout GitWork
git add .
git commit -m "Added hello.xml in GitWork"
git checkout master
git add .
git commit -m "Added hello.xml in master"
git diff master GitWork
git merge GitWork
git add hello.xml
git commit -m "Resolved merge conflict"
git add .gitignore
git commit -m "Added gitignore"
git branch
git branch -d GitWork
git log --oneline --graph --decorate
```

## Files Created

- README.txt
- hello.xml
- .gitignore
- Outputs/Lab10_Exercise04_Output.txt

## Result

Successfully created a merge conflict, resolved it manually, committed the resolution, updated `.gitignore`, and deleted the merged branch.