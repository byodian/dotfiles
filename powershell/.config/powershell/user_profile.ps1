Import-Module posh-git
Import-Module Terminal-Icons
Import-Module z
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussel.omp.json" | Invoke-Expression

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

# fzf
Import-Module PSFzf

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias c clear
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'

function which($command) {
  Get-command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
