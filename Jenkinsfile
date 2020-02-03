pipeline {
  agent any

  stages {
    stage('Docker') {
      steps {
        script {
          sh 'echo "ricardator" | docker login -u ricardator --password-stdin'
          docker.withRegistry('https://index.docker.io/v1/', 'docker') {
            image = docker.build("prueba:0.0.1")
          }
        }
      }
    }
  }
}
