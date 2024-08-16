TARGET_REPO=$1
BRANCH_NAME=$2

cd $TARGET_REPO

git status

# check if there is no PR for the branch, then create it
# otherwise the PR will be updated with the commit previously made
if [[ $(gh pr list -S head:$BRANCH_NAME --json title) == "[]" ]];
then gh pr create \
    --title "Auto-update foo-space examples" \
    --body "Please manually remove all non *.ipynp-files." \
    --base main;
fi