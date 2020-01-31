pipeline {
  environment {
      registry = "docker_hub_account/repository_name"
      registryCredential = 'dockerhub'
  }
  agent any

  tools {nodejs "node"}

  stages {
    stage('Install dependencies') {
        steps {
          sh 'npm install'
        }
    }

    stage('Test') {
        steps {
           sh 'node test.js'
        }
    }
  }
}
