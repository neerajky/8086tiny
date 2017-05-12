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
          sh 'echo $PASSWORD'
          echo "${env.USERNAME}"
          sh 'docker login -u $USERNAME -p $PASSWORD'
          echo 'Push to Repo'
        }
      }
      stage('Cleanup'){
        echo 'prune and cleanup'
        sh 'make -v'
      }
      stage('AWS Deployment'){
        echo "Deploy to AWS Server"
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awskeyStaging', accessKeyVariable: 'ACCESS_KEY_ID', secretKeyVariable: 'SECRET_KEY']]) {
          echo "Access Key: ${env.ACCESS_KEY_ID}"
          echo "Secret Key: ${env.SECRET_KEY}"
        }
      }
    }
    catch (err) {
      currentBuild.result = "FAILURE"
      throw err
    }
  }
​
