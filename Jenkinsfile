pipeline {
  environment {
      registry = "ricardator/devopstraining"
      registryCredential = 'dockerhub'
      dockerImage = ''
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
    // stage('Building image') {
    //   steps{
    //     script {
    //       docker.build registry + ":$BUILD_NUMBER"
    //     }
    //   }
    // }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'docker') { {
            image = docker.build("test:0.1")
//            dockerImage.push()
          }
        }
      }
    }
  }
}
