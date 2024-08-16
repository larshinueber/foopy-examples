TARGET_REPO=$1
BRANCH_NAME=$2

cd $TARGET_REPO

git status

sleep 5

echo $(git diff --numstat)
echo $(git diff --numstat | wc -l)

# check if there are any changes
if [[ $(git diff --numstat | wc -l) > 0 ]]; then 
echo "Changes detected. Committing and pushing."
git add .
git commit -m "Auto-update foo-space examples"
git push --set-upstream origin $BRANCH_NAME
fi

git status