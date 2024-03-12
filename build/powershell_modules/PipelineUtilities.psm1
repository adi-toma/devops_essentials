Import-Module powershell-yaml

<#
.SYNOPSIS

Read the yaml file.

.DESCRIPTION

Read the yaml file.
Uses powershell-yaml to deserialize from the read file.

.PARAMETER yamlFilePath
The full path to the yaml file.

.OUTPUTS

[System.Collections.Hashtable]. Returns the hashtable with the read yaml content.

#>
function Invoke-ReadYamlFile {
    param(
        $yamlFilePath
    )
    
   
    
    if (-not (Test-Path -Path $yamlFilePath)) {
        Out-Host -InputObject('Invoke-ReadYamlFile: The provided path {0} does not exist' -f $yamlFilePath) 
        return
    }

    Out-Host -InputObject('Invoke-ReadYamlFile: reading {0}' -f $yamlFilePath)

    $yamlContents = Get-Content -Path $yamlFilePath
    Out-Host -InputObject('Invoke-ReadYamlFile: contents {0}' -f $yamlContents)

    $parsedYaml = ConvertFrom-Yaml $yamlContents

    return $parsedYaml
}

<#
.SYNOPSIS

Create the VENV.

.DESCRIPTION

Create the VENV.
Create a new Python environment with the name and location supplied by parameter.

.PARAMETER pythonEnvName
The name of the python environment to create.

.PARAMETER pythonEnvPath
Optional paramater that defines the location of the Python environment.

.OUTPUTS

0 in case of success or non zero exit code in case of failure.

#>
function Invoke-CreateVirtualPythonEnv {
    param(
        $pythonEnvName,
        $pythonEnvPath 
    )
    
    $pythonEnvPath = Resolve-Path -Path "$PSScriptRoot\..\"
    $pythonEnvPath = Join-Path -Path $pythonEnvPath -ChildPath $pythonEnvName 

    Out-Host -InputObject('Invoke-CreateVirtualPythonEnv : creating VENV {0}' -f $pythonEnvPath)
    
    python.exe -m venv $pythonEnvPath

    if ($LASTEXITCODE -ne 0) {
        Out-Host -InputObject('Invoke-CreateVirtualPythonEnv : failed to create virtual Python Env {0}' -f $pythonEnvPath)
        Out-Host -InputObject('Invoke-CreateVirtualPythonEnv : python.exe returned {0}' -f $LASTEXITCODE)
    }
    
    return $LASTEXITCODE
}