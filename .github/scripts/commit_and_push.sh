TARGET_REPO=$1
BRANCH_NAME=$2

cd $TARGET_REPO

git status

git add .

# check if there are any changes
if [[ $(git diff --numstat --cached | wc -l) > 0 ]]; then 
echo "Changes detected. Committing and pushing."
git commit -m "Auto-update foo-space examples"
git push --set-upstream origin $BRANCH_NAME
fi

git status