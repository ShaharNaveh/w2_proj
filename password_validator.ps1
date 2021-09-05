$PASS=$args[0]

if( -not ($PASS.Length -ge 10)) {
    Write-Host "Error: Password is less than 10 characters."
}
