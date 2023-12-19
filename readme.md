# Windows Remove Bloatware

This is a simple script which removes a blacklist of bloatware from windows 10 or 11. You can add or remove apps from the list as you need it.

## How to use

1. Open powershell as Administrator
2. Run the following commands

```powershell
git clone git@github.com:pumbaba/windows-remove-bloatware.git
cd windows-remove-bloatware
powershell -ExecutionPolicy Bypass -File remove-bloatware.ps1
```

## Customize Blacklist

1. Run `Get-AppxPackage –AllUsers | Select Name` to get a list of all installed apps
2. Open the `remove-bloatware.ps1` and add apps as needed to the blacklist.
