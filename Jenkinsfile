pipeline{
  agent any
  stages{
    stage('Checkout'){
      steps{
        checkout scm
	}
      }

      stage('Build'){
        steps{
          echo "branch: ${env.BRANCH_NAME}"
          echo "Building-${env.BUILD_NUMBER}: ${env.BRANCH_NAME}in ${WORKSPACE}"
          sh 'g++ -v'
	  }
      }

      stage('Deploy to DockerHub'){
        steps{
          echo 'Login to Docker Hub'
          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            echo "${env.PASSWORD}"
            echo "${env.USERNAME}"
            //sh 'docker login -u $USERNAME -p $PASSWORD'
            echo 'Push to Repo'
          }
	}
      }
      stage('Cleanup'){
        steps{
          echo 'prune and cleanup'
          echo '${env.JOB_NAME}-${env.BUILD_NUMBER}'
          sh "echo '${env.JOB_NAME}-${env.BUILD_NUMBER}'"
	}
      }

      stage('Build Artifacts'){
        steps{
	  echo "Build Artifacts"
	}
      }

      stage('AWS Staging Deployment'){
        steps{
          echo "Deploy to AWS Server"
          withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS_STAGING', accessKeyVariable: 'ACCESS_KEY_ID', secretKeyVariable: 'SECRET_KEY']]) {
            echo "usernameVariable: ${env.ACCESS_KEY_ID}"
            echo "passwordVariable: ${env.SECRET_KEY}"
           }
	 }
      }
  }
}
