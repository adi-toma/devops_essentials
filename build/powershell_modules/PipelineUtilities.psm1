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