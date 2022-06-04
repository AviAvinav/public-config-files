# Oh-My-Posh Prompt
oh-my-posh init pwsh --config ~/.config/powershell/avi.omp.json | Invoke-Expression

# Alias
Set-Alias v nvim
Set-Alias g git
Set-Alias y yarn
Set-Alias p pnpm
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias explorer explorer.exe

#Icons
Import-Module Terminal-Icons

#PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

#FuzzyFinder
Import-Module PSfzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#Utils

function locate ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch ($command) {
    New-Item -Path $command -ItemType File | out-null && Write-Host Created $command
}

function rf ($command) {
    Remove-Item $command -Recurse && Write-Host Removed $command
}

function mcd ($command) {
    mkdir $command && cd $command
}

function renameUser ($oldName, $newName) {
    Rename-LocalUser -Name $oldName - NewName $newName
}

#Yarn Shortcuts

function yarnDev {
    yarn dev
}

New-Alias yd yarnDev

function yarnStart {
    yarn start
}

New-Alias ys yarnStart

#Pnpm Shortcuts

function pnpmInstall {
    pnpm install
}

New-Alias pi pnpmInstall

function pnpmDev {
    pnpm dev
}

New-Alias pd pnpmDev

function pnpmStart {
    pnpm start
}

New-Alias pst pnpmStart

