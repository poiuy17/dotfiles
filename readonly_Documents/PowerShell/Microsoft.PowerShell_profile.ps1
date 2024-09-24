# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$env:EDITOR = "nvim"
$env:VISUAL = "code"

# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_lean.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$HOME\.config\ohmyposh\themes\myposhtheme.omp.json" | Invoke-Expression


# posh-git
Import-Module posh-git -ErrorAction SilentlyContinue
# Install Git auto-completion if not already installed.
if (!(Get-Module "posh-git")) {
	Install-Module -Name posh-git -Scope CurrentUser -Force
	Import-Module posh-git
}


# PSReadLine
Import-Module PSReadLine
if (!(Get-Module "PSReadLine")) {
  Install-Module PSReadLine
	Import-Module PSReadLine
}

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


# ZLocation
Import-Module ZLocation
if (!(Get-Module "ZLocation")) {
  Install-Module ZLocation -Scope CurrentUser
	Import-Module ZLocation
}

Import-Module -Name Terminal-Icons
if (!(Get-Module "Terminal-Icons")) {
  Install-Module -Name Terminal-Icons -Repository PSGallery
	Import-Module Terminal-Icons
}

# Alias
Function gcifw {Get-ChildItem -Exclude .*  | Format-Wide Name -AutoSize}
Function gcia {Get-ChildItem | Format-Wide Name -AutoSize}
Remove-Item alias:\ls
Set-Alias ls gcifw
Set-Alias la gcia
Set-Alias ll Get-ChildItem
