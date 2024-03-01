#!/bin/bash

# Names of the resume files
local_resume="name_of_local_resume.pdf"
github_resume="name_of_resume_in_portfolio.pdf"

# Paths to the resume files
local_resume_path="/path/to/local/resume/$local_resume"
github_resume_path="/path/to/portfolio/resume/$github_resume"

# Function to perform git actions
perform_git_actions() {
    # Commit and push changes
    current_date=$(date +"%Y-%m-%d")

    cd /path/to/github/repo
    git add "$github_resume_path"
    git commit -m "updated resume on $current_date"
    git push origin main
}

# Monitor changes to local_resume file
fswatch -0 "$local_resume_path" | while read -d "" event; do
    # Copy the local resume to the GitHub repository
    cp "$local_resume_path" "$github_resume_path"
    perform_git_actions
done