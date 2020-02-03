pipeline {
  agent any

  stages {
    stage('Docker') {
      steps {
        docker.build("test:0.0.1")
      }
    }
  }
}
