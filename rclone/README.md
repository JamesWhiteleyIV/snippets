## Rclone is similar to Rsync but allows you to one-way sync from source to remote cloud server (e.g. laptop -> GoogleDrive)

Copy contents of `backup` folder to root of GoogleDrive and exclude `.git` folder.
```bash
rclone copy -P ./backup remote: --exclude .git/
```

Use the dry run flag to show a preview without doing any copying
```bash
rclone copy -P ./backup remote: --dry-run
```
