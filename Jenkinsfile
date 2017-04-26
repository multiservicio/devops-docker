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
    stage('SonarQube analysis') {
      steps {
        // requires SonarQube Scanner 2.8+
        withSonarQubeEnv('sonar') {
          sh "./helloworld/sonar-scanner/bin/sonar-scanner"
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo "Deploying..."'
      }
    }
    stage('Publish to Influxdb') {
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
  post {
    always {
      sh 'echo "Always in post"'  
    }
    failure {
        sh 'echo "The Pipeline failed :("'
    }  
  }
}