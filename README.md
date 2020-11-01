# GPD
On GPD win Max with Manjaro 20.x.x, Run all steps
On GPD win 2 with Manjaro 20.x.x, Run only Finally

## First

```bash
sudo mkdir -p /lib/firmware/edid
```
## Second

```bash
sudo echo "AP///////wAJ5QMAAwAAAAEdAQOACxF4LwAAoFdJmyYQSE8AAAABAQEBAQEBAQEBAQEBAQEBwhogUDAAEFAQEDIAbKwAAAAYAAAA/ABUVjA4MFdVTS1OTDAKAAAA/QA8PBAQBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMM=" | base64 --decode > /lib/firmware/edid/gpdwinmax.bin
```
## Third

Add in etc/default/grub

```bash
video=eDP-1:800x1280 drm.edid_firmware=eDP-1:edid/gpdwinmax.bin fbcon=rotate:1
```
## Finally
Run script to change touch orientation.

```bash
./touch.sh
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
