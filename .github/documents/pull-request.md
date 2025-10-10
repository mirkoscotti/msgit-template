# 🔄 GitHub Action - Automatic Pull Request Creation

This is the standard to automatically create **Work-In-Progress (WIP) Pull Requests** on the first push to branches in repositories created from this template.

## ⚡ Features

- **Automatic Pull Request creation**: Triggered on every push to non-main branches
- **Smart conflict handling**: Skips creation if a Pull Request already exists for the branch
- **Parent issue support**: Automatically sets the correct base branch for sub-issues
- **Draft Pull Request by default**: Creates draft Pull Requests to allow work-in-progress commits
- **Structured content**: Pre-filled with issue details, description, and checklist

**Examples:**
- Root issue #5 in `my-awesome-app` → `WIP: #5 - New feature` from `my-awesome-app` to `main`
- Sub-issue #15 (parent: #10) in `api-server` → `WIP: #15 - Specific task of the feature` to `api-server-10`

## ⚙️ Typical Workfloe

- Checks if the branch follows the `[repository-name]-[issue-number]` naming convention
- If the branch is compliant with the naming convention, extracts the issue number from the branch name
- Verifies if a Pull Request already exists for this branch
- Fetches title, description, and author from the linked issue 
- Checks if the issue has a parent issue
- If parent exists, creates Pull Request targeting the parent's branch
- If no parent, creates Pull Request targeting `main`
- Generates a draft Pull Request with structured content

## ✨ Generated Pull Request

### Pull Request Title Format
```
WIP: #[issue-number] - [issue-title]
```

### Pull Request Body Template
```markdown
## 🔗 Link to the issue
Resolves #${{ steps.issue_extractor.outputs.issue_number }}

## 📋 Description
${{ steps.issue_details.outputs.issue_body }}
            
Thanks to @${{ steps.issue_details.outputs.issue_user }} for reporting this issue!
            
## ✅ Checklist
- [ ] Implementation completed
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Code review required

---
*This PR was automatically created from issue [#${{ steps.issue_extractor.outputs.issue_number }}](${{ steps.issue_details.outputs.issue_url }})*
```

## 📚 Adopting this standard

When creating a new repository from this template:
- The action is automatically configured via `.github/workflows/pull-request.yml`
- Works seamlessly with the **Issue-To-Branch** action
- Developers just need to push to feature branches
- PRs are created as drafts and can be marked as ready when complete
- The action runs on every push except to the `main` branch