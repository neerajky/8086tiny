pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'make -v'
	sh 'git --version'
	sh 'which git'
	sh 'docker info'
      }
    }
  }
}
