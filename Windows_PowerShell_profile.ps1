$global:DefaultUser = [System.Environment]::UserName

function touch {
  set-content -Path ($args[0]) -Value ($null)
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Import-Module DirColors

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

if ($env:WT_SESSION) {
  oh-my-posh --init --shell pwsh --config ~\dotfiles\.agnoster.omp.json | Invoke-Expression
} 

function which($name) {
  Get-Command $name | Select-Object -ExpandProperty Definition
}

New-Alias vi vim
