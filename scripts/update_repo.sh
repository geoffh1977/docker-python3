#!/bin/bash
# Update The Git Repository Automatically

# Update Local Repository Tags
git fetch --tags
echo

# Update Git With New Version
echo "Updating Repository..."
echo "  Updating Master Branch"
git checkout master
git add -A :/
git commit -m "Automated: Updating Master Branch"

echo
echo "  Pushing Updates To Repository"
git push origin master > /dev/null

echo
echo "  Switch Back To Develop"
git checkout develop

echo
echo "Repository Successfully Updated"
echo

exit 0
