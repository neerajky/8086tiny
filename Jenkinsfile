node {
   stage('Preparation') {
     echo 'Preparation'
     checkout scm
   }
   stage('Build') {
      if (isUnix()) {
         echo "Is Unix"
         sh make
      } else {
         echo "Something Else"
      }
   }
   stage('Results') {
     echo "this is result"
   }
}
