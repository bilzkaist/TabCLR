#!/bin/bash

# Check if arguments are provided
if [ -z "$1" ]; then
  commit_msg="Auto commit at $(date +'%Y-%m-%d %H:%M:%S')"
else
  commit_msg="$1"
fi

if [ -z "$2" ]; then
  branch="main"  # Change this to 'main' if needed
else
  branch="$2"
fi

# Add all changes
git add .

# Commit changes
if ! git commit -m "$commit_msg"; then
  echo "Error: Failed to commit changes."
  exit 1
fi

# Push changes to the specified/default branch
if ! git push origin "$branch"; then
  echo "Error: Failed to push changes to $branch branch."
  exit 1
fi

echo "Changes committed and pushed successfully."
