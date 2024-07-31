# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias cc clear
Set-Alias -Name sd -Value StartDevenv
Set-Alias -Name branches -Value ViewBranches

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Oh My Posh
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\FrancescoBoasso\AppData\Local\Programs\oh-my-posh\themes\bit.omp.json' | Invoke-Expression

# Utility
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

function StartDevenv ($arg1) {
	start devenv $arg1
}

function ViewBranches ($arg1){
	git for-each-ref --sort=authorname --format "Author: %(authorname) , Branch: %(refname)"
}