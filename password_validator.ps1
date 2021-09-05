$PASS=$args[0]

if( -not ($PASS.Length -ge 10)) {
    Write-Host "Error: Password is less than 10 characters." -ForegroundColor Red
    exit 1
}

if ( $PASS -notmatch '\d+' -or $PASS -notmatch '[a-zA-Z]+' ) {
    Write-Host "Error: Does not contain both numbers and letters" -ForegroundColor Red
    exit 1
}

if ( $PASS -notmatch '(?-i)[a-z]+' ) {
    Write-Host "Error: Does not contain a lowercase letter" -ForegroundColor Red
    exit 1
}

if ( $PASS -notmatch '(?-i)[A-A]+' ) {
    Write-Host "Error: Does not contain an upercase letter" -ForegroundColor Red
    exit 1
}

Write-Host "Strong password!" -ForegroundColor Green
exit 0
