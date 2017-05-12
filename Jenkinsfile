node {
   stage('Preparation') {
     echo 'Preparation'
     checkout scm
   }
   stage('Build') {
     def WORKSPACE = pwd()
     echo "branch: ${env.BRANCH_NAME}"
     echo "Building ${env.BRANCH_NAME}in ${WORKSPACE}"
      if (isUnix()) {
         echo "Is Unix"
         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws', accessKeyVariable: 'ACCESSKEY', secretKeyVariable: 'SECRETKEY']]) {
           echo "${env.ACCESSKEY}"
           echo "${env.SECRETKEY}"
           echo 'Push to Repo'
         }
      } else {
         echo "Something Else"
      }
   }
   stage('Results') {
     echo "this is result"
   }
}
