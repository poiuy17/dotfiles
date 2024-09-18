# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# ohmyposh
Import-Module posh-git
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_lean.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$HOME\.config\ohmyposh\themes\myposhtheme.omp.json" | Invoke-Expression

Import-Module ZLocation
Import-Module PSReadLine
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Alias
Function gcifw {Get-ChildItem -Exclude .*  | Format-Wide Name -AutoSize}
Function gcia {Get-ChildItem | Format-Wide Name -AutoSize}
Remove-Item alias:\ls
Set-Alias ls gcifw
Set-Alias la gcia
Set-Alias ll Get-ChildItem

# utilities
function which($command) {
  Get-command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}