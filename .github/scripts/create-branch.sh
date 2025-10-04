#!/bin/bash
set -e

# Extract repository name
REPO_NAME=$(echo "$REPOSITORY" | cut -d'/' -f2)
echo "REPO_NAME=$REPO_NAME" >> $GITHUB_ENV
echo "Repository name: $REPO_NAME"

# Create branch name
BRANCH_NAME="${REPO_NAME}-${ISSUE_NUMBER}"
echo "BRANCH_NAME=$BRANCH_NAME" >> $GITHUB_ENV
echo "Branch name: $BRANCH_NAME"

# Check if branch already exists
git fetch origin
if git show-ref --verify --quiet refs/remotes/origin/$BRANCH_NAME; then
  echo "Branch $BRANCH_NAME already exists on remote. Skipping."
  echo "BRANCH_CREATED=false" >> $GITHUB_ENV
  exit 0
fi

# Check if a parent issue exists
PARENT_RESPONSE=$(curl -s -w "\n%{http_code}" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPOSITORY}/issues/${ISSUE_NUMBER}/parent")

# Save the output  
HTTP_CODE=$(echo "$PARENT_RESPONSE" | tail -n1)
PARENT_DATA=$(echo "$PARENT_RESPONSE" | sed '$d')

# Check the output
if [ "$HTTP_CODE" = "200" ]; then
  PARENT_NUMBER=$(echo "$PARENT_DATA" | jq -r '.number // empty')
  if [ -n "$PARENT_NUMBER" ]; then
    PARENT_TITLE=$(echo "$PARENT_DATA" | jq -r '.title')
    BASE_BRANCH="${REPO_NAME}-${PARENT_NUMBER}"
    echo "✓ Found parent issue: #${PARENT_NUMBER} - ${PARENT_TITLE}"
    echo "✓ Will create branch from: ${BASE_BRANCH}"
  else
    BASE_BRANCH="main"
    echo "⚠️  API returned 200 but no parent data found"
    echo "ℹ️  Will create branch from: ${BASE_BRANCH}"
  fi
elif [ "$HTTP_CODE" = "404" ]; then
  BASE_BRANCH="main"
  echo "ℹ️  No parent issue found (this is a top-level issue)"
  echo "ℹ️  Will create branch from: ${BASE_BRANCH}"
else
  echo "❌ API returned unexpected status code ${HTTP_CODE}"
  echo "Response body:"
  echo "$PARENT_DATA"
  echo "BRANCH_CREATED=false" >> $GITHUB_ENV
  exit 1
fi

# Check if parent branch already exists
git fetch origin
if git show-ref --verify --quiet refs/remotes/origin/$BASE_BRANCH; then
  echo "❌ Base branch ${BASE_BRANCH} does not exist!"
  echo "BRANCH_CREATED=false" >> $GITHUB_ENV
  exit 1
fi

# Create branch
echo "Creating new branch: $BRANCH_NAME"
git checkout -b "${BRANCH_NAME}" "origin/${BASE_BRANCH}"
git commit --allow-empty -m "Initialize branch for issue #${ISSUE_NUMBER}"
git push origin $BRANCH_NAME
echo "Branch $BRANCH_NAME created and pushed successfully."
echo "BRANCH_CREATED=true" >> $GITHUB_ENV