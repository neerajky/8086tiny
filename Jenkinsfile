#!/usr/bin/env groovy

node{
    currentBuild.result = "SUCCESS"
    try {
      stage('Checkout'){
        checkout scm
      }
      stage('Build'){
        def WORKSPACE = pwd()
        def GIT_BRANCH= 'git rev-parse HEAD | git branch -a --contains | grep remotes | sed s/.*remotes.origin.//'
        echo "Building ${GIT_BRANCH} in ${WORKSPACE}"
        sh 'make'
      }

      stage('Deploy to DockerHub'){
        echo 'Login to Docker Hub'
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh 'echo $PASSWORD'
          echo "${env.USERNAME}"
          sh 'docker login -u $USERNAME -p $PASSWORD'
          echo 'Push to Repo'
        }
        stage('Cleanup'){
          echo 'prune and cleanup'
          sh 'make clean'
        }
      }
    }
    catch (err) {
      currentBuild.result = "FAILURE"
      throw err
    }
  }
​
