
$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
Out-Host -InputObject("Creating python venv: $fullEnvPath")
python.exe -m venv $envName
& $activateScriptPath
#upgrade pip
python -m pip install --upgrade pip
pip list
deactivate
Out-Host -InputObject("exit code: {0}" -f $LASTEXITCODE)