$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"


# activate the Python environment
& $activateScriptPath 

flake8 $pythonSourcePath --output-file=flake8_results.txt

deactivate