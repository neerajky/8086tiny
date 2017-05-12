node {
   stage('Preparation') {
     echo 'Preparation'
     checkout scm
   }
   stage('Build') {
      if (isUnix()) {
         echo "Is Unix"
      } else {
         echo "Something Else"
      }
   }
   stage('Results') {
     echo "this is result"
     withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
       echo "${env.PASSWORD}"
       echo "${env.USERNAME}"y
       echo 'Push to Repo'
     }
   }
}
