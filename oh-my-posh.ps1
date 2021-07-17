winget install JanDeDobbeleer.OhMyPosh

cp "Meslo LG M Regular Nerd Font Complete.ttf" $env:systemroot\fonts -Force
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "FontName (TrueType)" /t REG_SZ /d "Meslo LG M Regular Nerd Font Complete.ttf" /f

Install-Module DirColors -Force
