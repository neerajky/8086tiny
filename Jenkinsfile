node{
    try {
      stage('Checkout'){
        checkout scm
      }
      stage('Build'){
        def WORKSPACE = pwd()
        echo "branch: ${env.BRANCH_NAME}"
        echo "Building-${env.BUILD_NUMBER}: ${env.BRANCH_NAME}in ${WORKSPACE}"
        sh 'g++ -v'
      }

      stage('Deploy to DockerHub'){
        echo 'Login to Docker Hub'
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          echo "${env.PASSWORD}"
          echo "${env.USERNAME}"
          //sh 'docker login -u $USERNAME -p $PASSWORD'
          echo 'Push to Repo'
        }
      }
      stage('Cleanup'){
        echo 'prune and cleanup'
        sh 'echo ${env.JOB_NAME}-${env.BUILD_NUMBER}'
      }
      stage('AWS Staging Deployment'){
        echo "Deploy to AWS Server"
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS_STAGING', accessKeyVariable: 'ACCESS_KEY_ID', secretKeyVariable: 'SECRET_KEY']]) {
          echo "usernameVariable: ${env.ACCESS_KEY_ID}"
          echo "passwordVariable: ${env.SECRET_KEY}"
        }
      }
    } catch (Exception err) {
      throw err
    }
  }
