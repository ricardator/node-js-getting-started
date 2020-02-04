pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'docker') {
            image = docker.build("test:0.1")
          }
        }
      }
    }
  }
}
