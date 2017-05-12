#!/usr/bin/env groovy

node{
    currentBuild.result = "SUCCESS"
      stage('Checkout'){
        checkout scm
      }
      stage('Build'){
        def WORKSPACE = pwd()
        echo "branch: ${env.BRANCH_NAME}"
        echo "Building-${env.BUILD_NUMBER}: ${env.BRANCH_NAME} in ${WORKSPACE}"
        sh 'g++ -v'
      }

      stage('Deploy to DockerHub'){
        echo 'Login to Docker Hub'

      }
      stage('Cleanup'){
        echo 'prune and cleanup'
        sh 'gcc -v'
      }
      stage('AWS Staging Deployment'){
        echo "Deploy to AWS Server"
      }
    echo "RESULT: ${currentBuild.result}"
  }
​
