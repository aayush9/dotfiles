$global:DefaultUser = [System.Environment]::UserName

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -EditMode Windows

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

if ($env:WT_SESSION -or ($env:TERM_PROGRAM -eq 'vscode') -or $IsMacOs -or $IsLinux) {
  Import-Module -Name DirColors
  oh-my-posh init pwsh --config ~\dotfiles\PSTheme.omp.json --manual | Invoke-Expression
}

function touch {
  set-content -Path ($args[0]) -Value ($null)
}

function which($name) {
  Get-Command $name | Select-Object -ExpandProperty Definition
}

New-Alias vi vim
New-Alias vim nvim
New-Alias sd p4
