pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('ramr2900-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t ramr2900/flask-random:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push ramr2900/flask-random:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}