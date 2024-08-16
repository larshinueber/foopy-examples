TARGET_REPO=$1
BRANCH_NAME=$2

cd $TARGET_REPO

git status

if [[ $(git diff --numstat | wc -l) > 0 ]]; then 
git add .
git commit -m "Auto-update foo-space examples"
git push --set-upstream origin $BRANCH_NAME
fi

git status