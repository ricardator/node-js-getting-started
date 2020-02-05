pipeline {
  // environment {
  //     registry = "ricardator/devopstraining"
  //     registryCredential = 'docker'
  // }
  agent any

  stages {

    stage('Installing dependencies') {
      steps {
        script{
          sh 'npm install'
          }
      }
    }

    stage ('Testing build'){
      steps {
        sh 'node test.js'
      }
    }

    stage('Test') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'docker') {
            image = docker.build("ricardator/devopstraining")
            image.push()
            image.push('latest')
          }
        }
      }
    }
  }
}
