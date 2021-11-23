The following will copy the `Pictures` directory including all its subfolders into `NewFolder` e.g. `~/NewFolder/Pictures`

```
rsync --progress -vra ~/MyFolder/Pictures/ ~/NewFolder/pictures
```

- -v is verbose
- -r is recursive
- -a is copy all timestamps, user permissions, etc
