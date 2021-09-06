param (
    [Parameter(Mandatory=$False, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $password=$null,

    [Parameter(Mandatory=$False, ValueFromPipeline=$false)]
    [System.String]
    $f=$null
)

if ( ( -not [string]::IsNullOrWhitespace($password)) -and ( -not [string]::IsNullOrWhitespace($f))) {
    Write-Host "Error: -f and -password can't be specified together" -ForegroundColor Red
    exit 1
}

if ( -not ( [string]::IsNullOrWhitespace($f) )) {
    $target_password = Get-Content $f -Raw
} else {
    $target_password = $password
}

if( -not ($target_password.Length -ge 10)) {
    Write-Host "Error: Password is less than 10 characters." -ForegroundColor Red
    exit 1
}

if ( $target_password -notmatch '\d+' -or $target_password -notmatch '[a-zA-Z]+' ) {
    Write-Host "Error: Does not contain both numbers and letters" -ForegroundColor Red
    exit 1
}

if ( $target_password -notmatch '(?-i)[a-z]+' ) {
    Write-Host "Error: Does not contain a lowercase letter" -ForegroundColor Red
    exit 1
}

if ( $target_password -notmatch '(?-i)[A-A]+' ) {
    Write-Host "Error: Does not contain an upercase letter" -ForegroundColor Red
    exit 1
}

Write-Host "Strong password!" -ForegroundColor Green
exit 0
