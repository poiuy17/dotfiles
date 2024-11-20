# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$env:EDITOR = "code"
$env:VISUAL = "code"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression

# posh-git
Import-Module posh-git -ErrorAction SilentlyContinue
# ZLocation
Import-Module ZLocation
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
