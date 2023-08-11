# Images
## Image Import Guide
Image import guide: https://www.youtube.com/watch?v=qQ918kbGKOw

## vIOS from VIRL
	- Guide: https://www.eve-ng.net/index.php/documentation/howtos/howto-add-cisco-vios-from-virl/

## IOL/IOU: images for linux/unix  
- Import guide: https://www.eve-ng.net/index.php/documentation/howtos/howto-add-cisco-iol-ios-on-linux/
	1) Download: https://drive.google.com/drive/folders/1qatcK8EV4ZVWk3j-G2MnUxi_cMQakKUk
	2) copy images into `opt/unetlab/addons/iol/bin/`
	3) Generate IOU license: https://www.itnetworkeng.org/generate-iou-license/ 
		- make sure the generated license is in `iourc` file in the same directory
	4) run `/opt/unetlab/wrappers/unl_wrapper -a fixpermissions`

## Win-7: 
	1) Download: https://drive.google.com/file/d/1PDUusIX0Iffhhe9SbR2c2C8QrdtPYu79/view
	2) copy image into `/opt/unetlab/addons/qemu/win-7/`
	3) run `/opt/unetlab/wrappers/unl_wrapper -a fixpermissions`
