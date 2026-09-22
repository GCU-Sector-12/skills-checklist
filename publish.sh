#!/bin/bash
# Creates the GitHub repo in your organisation, pushes the files and turns on GitHub Pages.
# Usage:  ./publish.sh <organisation-name> [repo-name]
set -e
ORG="$1"; REPO="${2:-skills-checklist}"
if [ -z "$ORG" ]; then echo "Usage: ./publish.sh <organisation-name> [repo-name]"; exit 1; fi
command -v gh >/dev/null || { echo "Install GitHub CLI first:  brew install gh   then:  gh auth login"; exit 1; }
gh auth status >/dev/null 2>&1 || gh auth login
cd "$(dirname "$0")"
gh repo create "$ORG/$REPO" --public --source=. --remote=origin --push \
  --description "Skills checklist – M3W226703 Group Project"
gh api -X POST "repos/$ORG/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null \
  && echo "GitHub Pages enabled."
OWNER_LC=$(echo "$ORG" | tr '[:upper:]' '[:lower:]')
echo
echo "Repo:     https://github.com/$ORG/$REPO"
echo "Form:     https://$OWNER_LC.github.io/$REPO/"
echo "Summary:  https://$OWNER_LC.github.io/$REPO/summary.html"
echo "(the site goes live about a minute after the first push)"
