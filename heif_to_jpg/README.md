#### Convert a single HEIC file to jpg
```bash
sudo apt install libheif-examples 
heif-convert IMG_1605.HEIC IMG_1605.jpg
```

NOTE: `jpg` must be in lowercase or it will complain it doesn't recognize the format

#### Convert all HEIC files in current folder to same filename but .jpg
```bash
for photo in *.HEIC; do heif-convert $photo ${photo/%.HEIC/.jpg}; done
```

#### Remove all HEIC files from current folder
```bash
rm *.HEIC
```
