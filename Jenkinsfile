#!/usr/bin/env groovy

node{
    currentBuild.result = "SUCCESS"
      stage('Checkout'){
        checkout scm
      }
      stage('Build'){
        sh 'g++ -v'
      }
    echo "RESULT: ${currentBuild.result}"
  }
​
