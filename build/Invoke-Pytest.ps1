$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
$pythonSourcePath = "$env:WORKSPACE\python\greetings"

# activate the Python environment
& $activateScriptPath

#change current working directory
Push-Location -Path $pythonSourcePath
pytest
pytest --html=report.html
Pop-Location

deactivate