pipeline {
  agent any
  triggers {
        pollSCM ('H/5 * * * *')
  }
  stages {
    stage('Tests') {
      steps {
        sh "echo 'testing...'"
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
    stage('Build') {
      steps {
        sh 'echo "Building..."'
      }
    }
    stage('Publish results to Influxdb') {
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS' 
        }
      }
      steps {
        step([$class: 'InfluxDbPublisher', customData: null, customDataMap: null, customPrefix: null, target: 'influxdb'])
      }
    }
  }
  post {
    always {
      sh 'echo "Success!!!"'  
    }
    failure {
        sh 'echo "The Pipeline failed :("'
    }  
  }
}