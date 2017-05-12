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
          echo 'Push to Repo'
        }
      }
      stage('Cleanup'){
        echo 'prune and cleanup'
        sh 'make clean'
      }
      stage('AWS Staging Deployment'){
        echo "Deploy to AWS Server"
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'AWS_CREDENTIALS_STAGING', usernameVariable: 'ACCESS_KEY_ID', passwordVariable: 'SECRET_KEY']]) {
          echo "credentialsId: ${env.AWS_CREDENTIALS_STAGING}"
          echo "usernameVariable: ${env.ACCESS_KEY_ID}"
          echo "passwordVariable: ${env.SECRET_KEY}"
        }
      }
    }
    catch (Exception err) {
      currentBuild.result = "FAILURE"
      throw err
    }
    echo "RESULT: ${currentBuild.result}"
  }
​
