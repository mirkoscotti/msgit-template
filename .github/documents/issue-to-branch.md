# 📝 GitHub Action - Issue-To-Branch Automation

This is the standard to create branches when GitHub Issues on repositories created from this template are labeled with:

- ![status:accepted](https://img.shields.io/badge/status:accepted-10B981?style=flat-square) - for each issue representing a feature
- ![status:confirmed](https://img.shields.io/badge/status:confirmed-DC2626?style=flat-square) - for each issue representing describing a bug

## ⚡ Features

- **Automatic branch creation**: Branch named `[repository-name]-[issue-number]`
- **Smart conflict handling**: Skips creation if branch already exists
- **Informative comments**: Updates the issue with branch and PR information

**Examples:**
- Issue #5 in `my-awesome-app` → `my-awesome-app-5`
- Issue #42 in `api-server` → `api-server-42`

## ⚙️ Typical Workflow

- Checks if the issue is a root or a sub-issue
- If the issue is a root, creates the branch from main
- If the issue is a sub-issue, creates the branch from the branch related to the parent issue
- The new branch is created following the naming convention above
- Generates a structured Pull Request linked to the issue
- Adds helpful comments and labels for better organization

## ✨ Generated Content

### Final comment
```markdown
🚀 **Branch and Pull Request successfully created!**

📋 **Branch:** [branch-name]

The branch is ready for development. Happy coding! 🎉"
```

## 📚 Adopting this standard

When creating a new repository from this template:
- The action will be automatically configured by the GitHub Action `.github/workflows/issue-to-branch.yml`
- Maintainers are responsible for label application during issues triage
- The action will be triggered once a maintainer will accept or confirm the issue
- Branch creation and related PR will be skipped if the branch already exists or an error occurs