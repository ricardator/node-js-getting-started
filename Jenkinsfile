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
          sh 'rm -f /root/.kube/config'
          sh 'az login --service-principal -u b2d19ddc-1a47-4b6b-8a48-265f8f6a842a -p 0f6ae567-fa81-49ae-8ef9-8091170079d1 --tenant 72a5b97d-7851-4b22-9f8c-4b1ba84d9c1f'
          sh 'az aks get-credentials --resource-group azuregroup --name azurecluster'
//          sh 'kubectl create secret docker-registry dockerlogin2 --docker-username=$DOCKERUSER --docker-password=$DOCKERPASS --docker-email=$DOCKEREMAIL -n devopstraining --dry-run -o yaml | kubectl apply -f -'
          sh 'kubectl apply -f azuredeploy.yml -o yaml'
          sh 'kubectl apply -f serviceA.yml -o yaml'
        }
      }
    }

  }
}
