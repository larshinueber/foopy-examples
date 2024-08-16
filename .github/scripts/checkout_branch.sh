TARGET_REPO=$1
BRANCH_NAME=$2
USER_EMAIL=$3
USER_NAME=$4

cd ./$TARGET_REPO

git config user.email $USER_EMAIL
git config user.name $USER_NAME

echo $BRANCH_NAME

git checkout -b $BRANCH_NAME

# check if branch exists on remote
if [[ $(git ls-remote --heads origin $BRANCH_NAME) ]]; then
git pull --set-upstream origin $BRANCH_NAME;
else
git push --set-upstream origin $BRANCH_NAME;
fi