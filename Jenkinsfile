pipeline {

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

    stage('build and push') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'docker') {
            image = docker.build("ricardator/devopstraining:$BUILD_NUMBER")
            image.push()
          }
        }
      }
    }
    stage ('deploying in Azure') {
      steps {
        script {
          sh 'az aks get-credentials --resource-group azuregroup --name azurecluster'
//          sh 'kubectl create secret docker-registry dockerlogin2 --docker-username=$DOCKERUSER --docker-password=$DOCKERPASS --docker-email=$DOCKEREMAIL -n devopstraining --dry-run -o yaml | kubectl apply -f -'
          sh 'kubectl apply -f azuredeploy.yml'
          sh 'kubectl apply -f serviceA.yml'
        }
      }
    }

  }
}
