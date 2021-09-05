$PASS=$args[0]

if( -not ($PASS.Length -ge 10)) {
    Write-Host "Error: Password is less than 10 characters."
}

if ( $PASS -notmatch '\d+' -or $PASS -notmatch '[a-zA-Z]+' ) {

    Write-Host "Error: Does not contain both numbers and letters"
}

if ( $PASS -notmatch '(?-i)[a-z]+' ) {
    Write-Host "Error: Does not contain a lowercase letter"
}

if ( $PASS -notmatch '(?-i)[A-A]+' ) {
    Write-Host "Error: Does not contain an upercase letter"
}
