$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
$pythonSourcePathToCheck = "$env:WORKSPACE\greetings"

# activate the Python environment
& $activateScriptPath

#change current working directory
Push-Location $pythonSourcePathToCheck
pytest 
Pop-Location

deactivate