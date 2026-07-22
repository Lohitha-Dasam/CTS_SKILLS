# Exercise 03 - Git Branching and Merging

## Objective

Learn Git branching and merging operations.

## Tools Used

- Git
- Git Bash
- Visual Studio Code

## Commands Executed

```bash
git init
git add .
git commit -m "Initial commit"
git branch GitNewBranch
git checkout GitNewBranch
git add .
git commit -m "Updated in GitNewBranch"
git checkout master
git diff master GitNewBranch
git merge GitNewBranch
git log --oneline --graph --decorate
git branch -d GitNewBranch
```

## Files Created

- sample.txt
- Outputs/Lab10_Exercise03_Output.txt

## Result

Successfully created a new branch, committed changes, merged the branch into master, viewed the commit graph, and deleted the merged branch.