$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
$pythonSourcePath = "$env:WORKSPACE\greetings"

# activate the Python environment
& $activateScriptPath

Push-Location $pythonSourcePath 
pytest
Pop-Location
 
deactivate
