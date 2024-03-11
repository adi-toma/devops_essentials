$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"

#activate the Python environment
& $activateScriptPath

Push-Location $env:WORKSPACE

python.exe setup.py sdist

Pop-Location

deactivate