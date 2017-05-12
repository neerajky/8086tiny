#!groovy

node{
    currentBuild.result = "SUCCESS"
    try{
     stage('Checkout'){
        checkout scm
     }
    } catch (error) {
        stage "Cleanup after fail"
        throw error
    } finally {
      echo "RESULT: ${currentBuild.result}"
    }
  }
​
