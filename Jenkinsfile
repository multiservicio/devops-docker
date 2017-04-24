pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        parallel(
          "Lint": {
            sh 'echo \'linted!\''
            
          },
          "Time": {
            sh 'echo "date"'
            
          }
        )
      }
    }
    stage('Deploy') {
      steps {
        sh 'Deploy'
      }
    }
  }
}