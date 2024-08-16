TARGET_REPO=$1
BRANCH_NAME=$2

cd $TARGET_REPO

git status

if [[ $(gh pr list -S head:$BRANCH_NAME --json title) == "[]" ]];
then gh pr create \
    --title "Auto-update foo-space examples" \
    --body "Please manually remove all non *.ipynp-files." \
    --base main;
fi