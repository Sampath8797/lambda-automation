pipeline {
    agent{
        node{ 
            label 'Built-In' 
            }
        }
  stages {
    stage('Lambda Deployment') {
      when { branch 'develop'}
      steps {
        timeout(time: 150, unit: 'SECONDS') {
          input "Replace Lambda Source Code ?"
        }
        script {
          sh "export AWS_PROFILE=cd-sandbox"
          sh "aws --version"
          sh "aws lambda update-function-code --function-name lambda-automation-test --zip-file fileb://lambda-function.zip"
        }
      }
    }
  }
}