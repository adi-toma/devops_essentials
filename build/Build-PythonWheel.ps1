$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"

# activate the Python environment
& $activateScriptPath

#change current working directory to the root of the repository
Push-Location $env:WORKSPACE
python setup.py bdist
Pop-Location

deactivate