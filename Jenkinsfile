pipeline {
  agent any
  stages {
        stage('Lambda Deployment') {
            when { branch 'develop' }
            steps {
                timeout(time: 100, unit: 'SECONDS') {
                    input "Lambda Source Code Deployment ?"
                }
                script {
                      sh "export AWS_PROFILE=cd-sandbox"
                      sh "aws lambda update-function-code --function-name lambda-automation-test --zip-file fileb://lambda-function.zip"
                }
            } 
    }
  }
}
