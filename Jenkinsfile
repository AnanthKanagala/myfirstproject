pipeline {
    agent any

    environment {
        TF_VERSION = '1.6.0'
        TF_PATH = 'C:\\Terraform\\terraform.exe'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Terraform') {
            steps {
                bat '''
                    powershell -Command "Invoke-WebRequest -Uri 'https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_windows_amd64.zip' -OutFile 'terraform.zip'"
                    powershell -Command "Remove-Item -Path '.\\terraform.exe' -Force -ErrorAction SilentlyContinue"
                    powershell -Command "Expand-Archive -Path 'terraform.zip' -DestinationPath '.'"
                    if not exist C:\\Terraform mkdir C:\\Terraform
                    move terraform.exe C:\\Terraform\\terraform.exe
                '''
            }
        }
        
        stage('Terraform Init') {
            steps {
                bat '''
                    powershell -Command "& $Env:TF_PATH init"
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                bat '''
                    powershell -Command "& $Env:TF_PATH validate"
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                bat '''
                    powershell -Command "& $Env:TF_PATH plan"
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                bat '''
                    powershell -Command "& $Env:TF_PATH apply -auto-approve"
                '''
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed. Please check the logs."
        }
        success {
            echo "Pipeline succeeded. Infrastructure updated!"
        }
    }
}
