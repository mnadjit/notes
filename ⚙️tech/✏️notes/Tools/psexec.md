# Reference
[reference](https://petri.com/psexec/)
# Common Usage
```cmd
psexec \\hostname cmd
psexec \\hostname powershell
```

```PowerShell
psexec "\\$($hostname)" $command
```
