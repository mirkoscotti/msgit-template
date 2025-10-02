# GitHub Labels Workflow

This repository uses a standardized labeling system to efficiently classify and manage issues and pull requests. Labels are organized into two main categories.

## Type Labels

Type labels classify the nature of the contribution:

| Label | Description |
|-------|-------------|
| ![type:bug](https://img.shields.io/badge/type:bug-E53E3E?style=flat-square) | Something isn't working |
| ![type:feature](https://img.shields.io/badge/type:feature-9F7AEA?style=flat-square) | A new feature |
| ![type:enhancement](https://img.shields.io/badge/type:enhancement-38A169?style=flat-square) | Improvement to existing feature |
| ![type:documentation](https://img.shields.io/badge/type:documentation-3182CE?style=flat-square) | Improvements or additions to documentation |
| ![type:maintenance](https://img.shields.io/badge/type:maintenance-A0AEC0?style=flat-square) | Code maintenance and refactoring |
| ![type:testing](https://img.shields.io/badge/type:testing-48BB78?style=flat-square) | Related to testing |
| ![type:security](https://img.shields.io/badge/type:security-FF0000?style=flat-square) | Security-related issues |
| ![type:performance](https://img.shields.io/badge/type:performance-FBB6CE?style=flat-square) | Performance improvements |
| ![type:accessibility](https://img.shields.io/badge/type:accessibility-FF6B6B?style=flat-square) | Accessibility improvements |

## Status Labels

Status labels indicate the current workflow stage:

| Label | Description |
|-------|-------------|
| ![status:triage](https://img.shields.io/badge/status:triage-F59E0B?style=flat-square) | Needs to be triaged |
| ![status:accepted](https://img.shields.io/badge/status:accepted-10B981?style=flat-square) | Feature accepted, ready to be worked on |
| ![status:confirmed](https://img.shields.io/badge/status:confirmed-DC2626?style=flat-square) | Bug confirmed, ready to be fixed |
| ![status:in-progress](https://img.shields.io/badge/status:in--progress-3B82F6?style=flat-square) | Currently being worked on |
| ![status:review](https://img.shields.io/badge/status:review-8B5CF6?style=flat-square) | Ready for review |
| ![status:blocked](https://img.shields.io/badge/status:blocked-EF4444?style=flat-square) | Blocked by external dependency |
| ![status:on-hold](https://img.shields.io/badge/status:on--hold-6B7280?style=flat-square) | On hold for now |
| ![status:duplicate](https://img.shields.io/badge/status:duplicate-9CA3AF?style=flat-square) | Duplicate of another issue |
| ![status:wontfix](https://img.shields.io/badge/status:wontfix-374151?style=flat-square) | Won't be fixed |

## Typical Workflows

### For Bug Reports
1. **Creation**: `type:bug` + `status:triage`
2. **After evaluation**: `status:confirmed` (if confirmed)
3. **During development**: `status:in-progress`
4. **Before merge**: `status:review`

### For Feature Requests
1. **Creation**: `type:feature` + `status:triage`
2. **After evaluation**: `status:accepted` (if approved)
3. **During development**: `status:in-progress`
4. **Before merge**: `status:review`

## Guidelines for Contributors

### When opening an issue
- **Be specific** in the title and description
- **Don't apply labels** - maintainers will do this during triage
- **Provide sufficient details** to allow proper classification

### When working on an issue
- **Assign yourself** to the issue before starting
- **Update regularly** on progress in comments
- **Change status** to `in-progress` when you begin (if you have permissions)

### For pull requests
- **Reference** the related issue (e.g., "Fixes #123")
- **Apply** the `status:review` label when ready for review
- **Respond promptly** to review feedback

## Automatic Setup

This repository includes a GitHub Action that automatically configures all these labels. Labels are created/updated whenever a push is made to the main branch, replacing GitHub's default labels with our standardized system.

---

*This labeling system helps keep the repository organized and facilitates collaboration. If you have questions about the workflow, don't hesitate to ask in issue comments!*