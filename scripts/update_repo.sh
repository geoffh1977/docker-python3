#!/bin/bash
# Update The Git Repository Automatically
LOCAL_VERSION="latest"
APP_NAME="$(grep "appName" config.yml | cut -d: -f 2- | sed 's/^ //g')"

# Update Local Repository Tags
git fetch --tags
echo

# Check If Version Already Exists In Repository
if git tag | grep -q "${LOCAL_VERSION}"
then
  echo "Version ${LOCAL_VERSION} Already Exists In Repository - No Action Required"
  exit 1
fi

# Update Git With New Version
echo "Updating Repository..."
echo "  Create Release Branch"
git branch "release/${LOCAL_VERSION}"
git checkout "release/${LOCAL_VERSION}"
git add -A :/
git commit -m "Automated: Create Release"

echo "  Merge Back Into master Branch"
git checkout master
git merge "release/${LOCAL_VERSION}" --no-edit

echo "  Remove Release Branch"
git branch -d "release/${LOCAL_VERSION}"

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
