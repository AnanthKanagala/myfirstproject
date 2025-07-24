pipeline {
  agent any

  environment {
    TF_VAR_project_id         = "your-gcp-project-id"
    TF_VAR_dataset_id         = "your_dataset_name"
    TF_VAR_gcp_credentials_file = "C:\\Users\\anant\\Downloads\\crested-sentry-363807-8678ab569e98.json"  // Must be accessible to Jenkins
    PATH = "C:\\Terraform\\bin;${env.PATH}"  // Add terraform.exe if needed
  }

  stages {
    stage('Init Terraform') {
      steps {
        powershell 'terraform init'
      }
    }
    stage('Plan Infrastructure') {
      steps {
        powershell 'terraform plan'
      }
    }
    stage('Apply Infrastructure') {
      steps {
        powershell 'terraform apply -auto-approve'
      }
    }
  }
}
