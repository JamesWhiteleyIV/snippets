The following will copy the contents of `src` folder into `dst`. The trailing `/` on source directory means "copy the contents of this folder" 
```
rsync --progress -vra ~/MyFolder/src/ ~/NewFolder/dst
```

- -v is verbose
- -r is recursive
- -a is copy all timestamps, user permissions, etc


The following will copy the `src` folder into `dst`. 
```
rsync --progress -vra ~/MyFolder/src ~/NewFolder/dst
```

