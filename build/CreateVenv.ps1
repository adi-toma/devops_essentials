Import-Module -Name "$PSScriptRoot\powershell_modules\PipelineUtilities.psm1" -Force

$yamlFilePath = "$PSScriptRoot\pipeline_config.yaml"
$yamlConfigContents = Invoke-ReadYamlFile -yamlFilePath $yamlFilePath

$envName = $yamlConfigContents['python_env_name']
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"

Out-Host -InputObject("Workspace env variable: {0}" -f $env:WORKSPACE)
Out-Host -InputObject("Creating python venv: $fullEnvPath")
python.exe -m venv $fullEnvPath

# activate the Python environment
& $activateScriptPath

#upgrade pip
python -m pip install --upgrade pip
pip install flake8
pip install pytest
pip install pyyaml
pip install nose
pip install pytest-html

pip list

deactivate

Out-Host -InputObject("exit code: {0}" -f $LASTEXITCODE)