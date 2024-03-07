$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"
 
Out-Host -InputObject("Workspace env variable: {0}" -f $env:WORKSPACE)
Out-Host -InputObject("Creating python venv: $fullEnvPath")
C:\Users\rares\AppData\Local\Programs\Python\Python312\python.exe -m venv $fullEnvPath
 
# activate the Python environment
& $activateScriptPath
 
#upgrade pip
python -m pip install --upgrade pip
pip install flake8
pip list
 
deactivate
 
Out-Host -InputObject("exit code: {0}" -f $LASTEXITCODE)