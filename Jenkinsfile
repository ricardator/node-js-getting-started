pipeline {
  // environment {
  //     registry = "ricardator/devopstraining"
  //     registryCredential = 'dockerhub'
  //     dockerImage = ''
  // }
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
    stage('Building image') {
      // agent {
      //   docker {
      //     label 'docker'
      //     image 'node:7-alpine'
      //   }
      // }
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
