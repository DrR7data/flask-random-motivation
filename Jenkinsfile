//For work with jenkis and ECR
pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    AWS_DEFAULT_REGION="us-east-1"
    THE_BUTLER_SAYS_SO=credentials('aws-crendentails-rrrm')
    ECR_REGISTRY=credentials('ecr-registry')
    }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t ramr2900/flask-random .'
      }
    }
    stage('Auth') {
      steps {
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY'
      }
    }
    stage('tag ECR') {
      steps {
        sh 'docker tag ramr2900/flask-random:latest $ECR_REGISTRY/ramr2900/flask-random:latest'
      }
    }
    stage('push ECR') {
      steps {
        sh 'docker push $ECR_REGISTRY/ramr2900/flask-random:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}