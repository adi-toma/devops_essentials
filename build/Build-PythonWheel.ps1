<#
    Script to build the Python wheel
    Prerequisites: $env:WORKSPACE env variable is needed
#>
param (
    # name of the output image
    [string]$buildParam = 'clean'
)

$envName = 'py_virtual_env'
$fullEnvPath = "$PSScriptRoot\$envName"
$activateScriptPath = "$fullEnvPath\Scripts\Activate.ps1"

# activate the Python environment
& $activateScriptPath

#change current working directory to the root of the repository
Push-Location $env:WORKSPACE
python setup.py $buildParam
Pop-Location

deactivate