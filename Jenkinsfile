node {
   stage('Preparation') {
     echo 'Preparation'
     checkout scm
   }
   stage('Build') {
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
