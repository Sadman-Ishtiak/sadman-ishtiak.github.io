#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Get the current branch name (e.g., main or master)
CURRENT_BRANCH=$(git branch --show-current)

if [ -z "$CURRENT_BRANCH" ]; then
    echo "❌ Error: Not in a git repository or no active branch found."
    exit 1
fi

echo "⚠️  WARNING: This will delete ALL Git history for branch '$CURRENT_BRANCH'."
echo "Your current project files will be kept intact."
read -p "Are you sure you want to proceed? (y/N): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "❌ Operation cancelled."
    exit 1
fi

# 2. Backup confirmation reminder
echo "📦 Step 1: Creating a temporary orphan branch..."
git checkout --orphan temp_history_branch

# 3. Stage all files
echo "📝 Step 2: Staging all files..."
git add -A

# 4. Create the new initial commit
echo "💾 Step 3: Creating a fresh initial commit..."
git commit -m "Initial commit"

# 5. Delete the old branch locally
echo "🗑️  Step 4: Deleting old local branch history..."
git branch -D "$CURRENT_BRANCH"

# 6. Rename the temporary branch to the original branch name
echo "✏️  Step 5: Renaming current branch back to '$CURRENT_BRANCH'..."
git branch -m "$CURRENT_BRANCH"

# 7. Force push to the remote repository
echo "🚀 Step 6: Force-pushing clean history to remote origin..."
echo "Note: This may require password/SSH authentication."
git push -f origin "$CURRENT_BRANCH"

echo "✅ Success! Your Git history has been completely reset without losing your files."
echo "⚠️  IMPORTANT: If you have collaborators, they will need to re-clone the repository or reset their local branches to match the new history."