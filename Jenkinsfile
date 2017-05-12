#!/usr/bin/env groovy

node{
    currentBuild.result = "SUCCESS"
    try {
      stage('Checkout'){
        checkout scm
      }
      stage('Build'){
        def WORKSPACE = pwd()
        echo "branch: ${env.BRANCH_NAME}"
        echo "Building-${env.BUILD_NUMBER}: ${env.BRANCH_NAME}in ${WORKSPACE}"
        sh 'make'
      }

      stage('Deploy to DockerHub'){
        echo 'Login to Docker Hub'
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          echo "${env.PASSWORD}"
          echo "${env.USERNAME}"
          sh 'docker login -u $USERNAME -p $PASSWORD'
          echo 'Push to Repo'
        }
      }
      stage('Cleanup'){
        echo 'prune and cleanup'
        sh 'make clean'
      }
      stage('AWS Deployment'){
        echo "Deploy to AWS Server"
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS', accessKeyVariable: 'ACCESS_KEY_ID', secretKeyVariable: 'SECRET_KEY']]) {
          echo "credentialsId: ${env.AWS_CREDENTIALS}"
          echo "accessKeyVariable: ${env.ACCESS_KEY_ID}"
          echo "secretKeyVariable: ${env.SECRET_KEY}"
        }
      }
    }
    catch (err) {
      currentBuild.result = "FAILURE"
      throw err
    }
  }
​
