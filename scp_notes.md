## Using scp over ssh

# scp command format is as below
```
scp username@ip_address:path/to/file/on/server path/to/file/on/our/computer

```

# To copy an entire folder we need to use -r with the above command
```
scp -r username@ip_address:path/to/folder path/to/folder/on/our/computer

```

#Uploading a file using scp
```
scp path/to/file username@ip_address:path/to/file/on/server
```

* For upload or download to work, the source/destination dir must exist *