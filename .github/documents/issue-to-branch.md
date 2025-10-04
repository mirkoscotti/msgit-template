# 📝 GitHub Action - Issue-To-Branch Automation

This is the standard to create branches and Pull Requests when GitHub Issues on repositories created from this template are labeled with:

- ![status:accepted](https://img.shields.io/badge/status:accepted-10B981?style=flat-square) - for each issue representing a feature
- ![status:confirmed](https://img.shields.io/badge/status:confirmed-DC2626?style=flat-square) - for each issue representing describing a bug

## ⚡ Features

- **Automatic branch creation**: Branch named `[repository-name]-[issue-number]`
- **Structured PR generation**: Includes issue link, description, and checklist
- **Smart conflict handling**: Skips creation if branch already exists
- **Informative comments**: Updates the issue with branch and PR information

**Examples:**
- Issue #5 in `my-awesome-app` → `my-awesome-app-5`
- Issue #42 in `api-server` → `api-server-42`

## ⚙️ Typical workflow

- Checks if the issue is a root or a sub-issue
- If the issue is a root, creates the branch from main
- If the issue is a sub-issue, creates the branch from the branch related to the parent issue
- The new branch is created following the naming convention above
- Generates a structured Pull Request linked to the issue
- Adds helpful comments and labels for better organization

## ✨ Generated Content

### Pull Request Template
```markdown
## 🔗 Link to the issue
Resolves #{issue-number}

## 📋 Description
{original-issue-description}

## ✅ Checklist
- [ ] Implementation completed
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Code review required

---
*This PR was automatically created from issue #{issue-number}*
```

### Final comment
```markdown
🚀 **Branch and Pull Request successfully created!**

📋 **Branch:** [branch-name]
🔄 **Pull Request:** Go to [Pull Requests](https://github.com/[owner]/[repository-name]/pulls) to view the PR created.

The branch is ready for development. Happy coding! 🎉"
```


## 📚 Adopting this standard

When creating a new repository from this template:
- The action will be automatically configured by the GitHub Action `.github/workflows/issue-to-branch.yml`
- Maintainers are responsible for label application during issues triage
- The action will be triggered once a maintainer will accept or confirm the issue
- Branch creation and related PR will be skipped if the branch already exists or an error occurs