$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
$pythonSourcePath = "$env:WORKSPACE\greetings"

# activate the Python environment
& $activateScriptPath

flake8 $pythonSourcePath --output-file=flake8_results.txt

if ($LASTEXITCODE -ne 0) {
    Write-Output "The program failed with exit code: " + $LASTEXITCODE
    Get-Content -Path .\flake8_results.txt
} else {
    Write-Output "The program completed successfully"
}

deactivate