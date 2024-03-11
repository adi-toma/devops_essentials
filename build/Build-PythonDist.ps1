$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
@pythonSourcePath = "$env:WORKSPACE\python"

#activate the Python environment
& $activateScriptPath

Push-Location $pythonSourcePath

python.exe setup.py sdist

Pop-Location

deactivate