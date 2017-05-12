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
         sh "gcc -v"
      } else {
         echo "Something Else"
      }
   }
   stage('Results') {
     echo "this is result"
   }
}
