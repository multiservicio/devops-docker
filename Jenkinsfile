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
        sh 'echo "Deploying..."'
      }
    }
  }
  post {
    when {
      expression {
        currentBuild.result == null || currentBuild.result == 'SUCCESS' 
      }
    }
    steps {
      echo 'Publishing to Influxdb'
      step([$class: 'InfluxDbPublisher', customData: null, customDataMap: null, customPrefix: null, target: 'influxdb'])
    }
  }
}