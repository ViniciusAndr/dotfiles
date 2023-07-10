# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#$omp_config = Join-Path $PSScriptRoot ".\sterbz.omp.json"
#oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\vinic\AppData\Local\Programs\oh-my-posh\themes\spaceship.omp.json' | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias c clear
Set-Alias g git
Set-Alias gs Git-Status
Set-Alias glo Git-Log
Set-Alias gd Git-Diff
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function w ($command){
 where.exe $command
}

function ts(){
  oh-my-posh toggle spotify
}

#Git functions
function Git-Status() {
  git status
}

function Git-Log() {
  git log
}

function Git-Diff($file) {
  git diff $file
}
