pipeline {
    agent any
    
    stages{
        stage('setup_venv'){
            steps {
                PowerShell(". '.\\build\\CreateVenv.ps1'") 
            }
        }

        stage('flake_8_check'){
            steps {
                PowerShell(". '.\\build\\Invoke-Flake8.ps1'")
            }
        }

    }



post
{
//cleanup
	always{
	cleanWs()
	}
}
}
def PowerShell(psCmd) {
    psCmd=psCmd.replaceAll("%", "%%")
    bat "powershell.exe -NonInteractive -ExecutionPolicy Bypass -Command \"\$ErrorActionPreference='Stop';[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$psCmd;EXIT \$global:LastExitCode\""
}
