# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$env:EDITOR = "code"
$env:VISUAL = "code"

# starship
Invoke-Expression (&starship init powershell)

# posh-git
Import-Module posh-git -ErrorAction SilentlyContinue
# PSReadLine
Import-Module PSReadLine

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Alias
Function gcifw {Get-ChildItem -Exclude .*  | Format-Wide Name -AutoSize}
Function gcia {Get-ChildItem | Format-Wide Name -AutoSize}
Remove-Item alias:\ls
Set-Alias ls gcifw
Set-Alias la gcia
Set-Alias ll Get-ChildItem
