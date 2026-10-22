#!/usr/bin/env bash
# Publish the explainer to GitHub and GitHub Pages (gh-pages branch).
# Requires: gh (authenticated as the repo owner), git. Idempotent.
#
#   ./publish-Cursor.sh
#   OWNER=mizcausevic-dev REPO=tavr-deployment-jig ./publish-Cursor.sh
set -euo pipefail

OWNER="${OWNER:-$(gh api user --jq .login)}"
REPO="${REPO:-tavr-deployment-jig}"
ABOUT="Stylized 34-second motion study of self-expanding transcatheter valve deployment, nitinol expansion, and pericardial leaflet coaptation."
TOPICS=(medical-visualization motion-design tavr nitinol heart-valve anatomy canvas educational github-pages)

cd "$(dirname "$0")"
git rev-parse --is-inside-work-tree >/dev/null

echo "== target: https://github.com/$OWNER/$REPO  (Pages: https://$OWNER.github.io/$REPO/)"
gh auth status >/dev/null

if ! gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  echo "== creating repository"
  gh repo create "$OWNER/$REPO" --public --description "$ABOUT"
else
  echo "== repository exists"
fi
if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "https://github.com/$OWNER/$REPO.git"
fi

git checkout -q main
git branch -f gh-pages main
echo "== pushing main and gh-pages"
git push -u origin main
git push -f -u origin gh-pages

if gh api "repos/$OWNER/$REPO/pages" >/dev/null 2>&1; then
  gh api -X PUT "repos/$OWNER/$REPO/pages" -f 'source[branch]=gh-pages' -f 'source[path]=/' >/dev/null
  echo "== pages source updated"
else
  gh api -X POST "repos/$OWNER/$REPO/pages" -f 'source[branch]=gh-pages' -f 'source[path]=/' >/dev/null
  echo "== pages enabled"
fi

gh repo edit "$OWNER/$REPO" --description "$ABOUT" --homepage "https://$OWNER.github.io/$REPO/" >/dev/null
args=(); for t in "${TOPICS[@]}"; do args+=(--add-topic "$t"); done
gh repo edit "$OWNER/$REPO" "${args[@]}" >/dev/null
echo "== about + topics set"
echo "== pages status:"; gh api "repos/$OWNER/$REPO/pages" --jq '{status: .status, url: .html_url, branch: .source.branch}'
