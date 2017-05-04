node {
  stage("Prepare") {
    checkout scm
  }
  
  stage('Print env') {
    sh 'printenv'
  }

  stage("Sonar") {

    // Adding variables to sonar.properties
    sh "echo sonar.github.repository=multiservicio/devops-docker >> sonar-project.properties"
    sh "echo sonar.analysis.mode=preview >> sonar-project.properties"
    sh "echo sonar.github.pullRequest=${pullRequestId(env.BRANCH_NAME)}>> sonar-project.properties"

    withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')])){
      sh "echo sonar.github.oauth=$GITHUB_TOKEN >> sonar-project.properties"
    }
    
    withSonarQubeEnv('sonar') {
      sh "./helloworld/sonar-scanner/bin/sonar-scanner"
    }  
  }

  stage('Publish to Influxdb') {
    step([$class: 'InfluxDbPublisher', customData: null, customDataMap: null, customPrefix: null, target: 'influxdb']) 
  }

}

/**
 * Get pull request id from branch string
 *
 * @param branch
 * @return
 */
String pullRequestId(String branch) {
    return (branch =~ /^PR-(\d+)$/)[0][1]
}