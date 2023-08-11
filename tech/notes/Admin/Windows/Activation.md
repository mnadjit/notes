# Re-activation on new device
System > Activation > Troubleshoot > I recently changed hardware on this device > select old device

# Tools
## SLUI
opens the Windows Activation UI in Windows Settings
`slui 3`: opens activation window
`slui 4`: opens activation support window
## SLMGR
### Activate Using a license key (25 char long alpha-neumeric)
Install product key:
- `slmgr.vbs /ipk $licence_25_digit_key`
Activate Windows:
- `slmgr /ato`
## Troubleshooting
`slui 0x2a $error_code`: to get the error description
- e.g. `slui 0x2a 0xc004f069`
## Clear current licence to enter a new key
Reset licensing status of the machine
`slmgr /rearm`
Uninstall product key:
- `slmgr /upk`
Clear product key from registry (prevents disclosure attacks!)
- `slmgr /cpky`
