node {
   stage('Preparation') {
     echo 'Preparation'
     checkout scm
   }
   stage('Build') {
      if (isUnix()) {
         echo "Is Unix"
         sh make -v
      } else {
         echo "Something Else"
      }
   }
   stage('Results') {
   withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
     echo "${env.PASSWORD}"
     echo "${env.USERNAME}"y
     echo 'Push to Repo'
   }
   }
}
