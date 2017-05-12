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
         withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
           echo "${env.PASSWORD}"
           echo "${env.USERNAME}"y
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
