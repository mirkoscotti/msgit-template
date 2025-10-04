# 🔍 GitHub Action - Assign Triage Label On Issue

The repository template standardizes part of the issues lifecycle to automatically assign the label ![status:triage](https://img.shields.io/badge/status:triage-F59E0B?style=flat-square) to all newly opened issues in each repository created from this template.

## 📚 Adopting this standard

When creating a new repository from this template:
- The GitHub Action `.github/workflows/triage-on-issue.yml` will run once a new issue is created
- Consider documenting the labels state machine in your repository's CONTRIBUTING.md
- Maintainers are responsible for label application during issues triage