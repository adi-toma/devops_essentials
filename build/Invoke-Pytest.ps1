$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
$pythonSourcePath = "$env:WORKSPACE\greetings"

& $activateScriptPath

#change current working directory
Push-Location -Path $pythonSourcePath
pytest
Pop-Location

deactivate