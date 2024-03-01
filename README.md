# Resume Auto-Updater

This repository contains a shell script that automatically updates your resume in your GitHub portfolio whenever changes are made to your local resume file.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/prasidh-agg/resume-sync.git
   ```

2. Edit the shell script `resume-sync.sh` and update the following variables:

   - `local_resume`: Name of the resume file on your local machine.
   - `github_resume`: Name of the resume file in your GitHub portfolio.
   - `local_resume_path`: Path to the resume file on your local machine.
   - `github_resume_path`: Path to the resume file in your GitHub portfolio.

3. Run the script in your terminal using the following command:

   ```bash
   nohup ./resume-sync.sh > /path/to/log/file/output.log 2>&1 &
   ```

   This command will run the script in the background and log the output to `/path/to/log/file/output.log`.

## How It Works

The script monitors changes to your local resume file using `fswatch`. When changes are detected, it copies the updated resume to your GitHub repository and performs the following Git actions:

1. Adds the updated resume file.
2. Commits the changes with a message indicating the date of the update.
3. Pushes the changes to the `main` branch of your GitHub repository.

## Notes

- Ensure that you have `fswatch` installed on your system. You can install it via Homebrew on macOS or using your system's package manager on Linux.
- Make sure to replace `/path/to/local/resume/` and `/path/to/portfolio/resume/` with the actual paths to your local and GitHub repository resume files respectively.
- Replace `origin` with your remote repository name if it differs.
- This script assumes that you're using the `main` branch as your primary branch. If your primary branch is named differently, modify the Git commands accordingly.
