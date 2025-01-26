oh-my-posh init pwsh --config ~/Documents/skodo.omp.json | Invoke-Expression

Set-Alias -Name notepad -Value "$env:PROGRAMFILES\Notepad++\notepad++.exe"

function update {
    winget update --all --scope user
}


