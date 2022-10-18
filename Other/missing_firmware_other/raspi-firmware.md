add the following to /etc/fstab:

```
tmpfs         /boot/firmware tmpfs rw 0 0
```

then run 
```
sudo mount /boot/firmware" 
```

After ```sudo apt update``` succeeds

```
cp /usr/lib/raspi3-firmware/* /boot/
```
