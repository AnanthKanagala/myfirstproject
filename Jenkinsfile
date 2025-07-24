pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // Secret file in Jenkins
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/AnanthKanagala/myfirstproject.git', branch: 'main'
      }
    }
    stage('Terraform Init') {
      steps {
        powershell 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        powershell 'terraform plan -var="project_id=your-gcp-project-id" -var="dataset_id=my_dataset"'
      }
    }
    stage('Terraform Apply') {
      steps {
        powershell 'terraform apply -var="project_id=your-gcp-project-id" -var="dataset_id=my_dataset" -auto-approve'
      }
    }
  }
}
