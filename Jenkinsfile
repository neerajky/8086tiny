pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'make -v'
        sh 'git --version'
        sh 'which git'
        sh '''GIT_BRANCH=`git rev-parse HEAD | git branch -a --contains | grep remotes | sed s/.*remotes.origin.//`

def gitCommit = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
echo gitCommit'''
      }
    }
  }
}