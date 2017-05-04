node {
  stage("Prepare") {
    checkout scm
  }
  stage('Print env') {
    sh 'printenv'
  }
  stage("Sonar") {
    withSonarQubeEnv('sonar') {
      sh "./helloworld/sonar-scanner/bin/sonar-scanner"
    }  
  }
  stage('Publish to Influxdb') {
    step([$class: 'InfluxDbPublisher', customData: null, customDataMap: null, customPrefix: null, target: 'influxdb']) 
  }

}