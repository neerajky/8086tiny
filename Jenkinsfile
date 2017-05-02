pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'make -v'
	sh 'git -v'
	sh 'which git'
	sh 'which docker'
	sh 'docker -v'
      }
    }
  }
}
