# GitHub Labels Workflow

This repository template defines a standardized labeling system to efficiently classify and manage issues and pull requests. Labels are organized into two main categories.

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

## Adopting this standard

When creating a new repository from this template:
- The labels will be automatically configured by the GitHub Action `.github/workflows/setup-labels.yml`
- Consider documenting the workflow in your repository's CONTRIBUTING.md
- Maintainers are responsible for label application during issue triage