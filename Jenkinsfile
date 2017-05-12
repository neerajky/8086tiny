node{
    currentBuild.result = "SUCCESS"
    try {
    stage('Preparation') {
    echo 'Preparation'
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
  }
    }
    catch (Exception err) {
      currentBuild.result = "FAILURE"
      throw err
    }
    echo "RESULT: ${currentBuild.result}"
  }
​
