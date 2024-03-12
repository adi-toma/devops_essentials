Import-Module -Name "$PSScriptRoot\powershell_modules\PipelineUtilities.psm1" - Force


$yamlFilePath = "$PSScriptRoot\pipeline_config.yaml"

$yamlConfigContents = Invoke-ReadYamlFile -yamlFilePath $yamlFilePath

Out-Host -InputObject('Test-PipelineUtilities: Contents: of config file: {0}' -f $yamlConfigContents)

Out-Host -InputObject('$yamlConfigContents: read value from key {0}' -f ('python_env_name'))