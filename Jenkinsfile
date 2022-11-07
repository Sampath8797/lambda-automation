pipeline {
  agent any
  stages {
    stage('Staging DB migration') {
      when { branch 'develop'}
        stage('Lambda Deployment') {
            when { branch 'lambda-test' }
            steps {
                timeout(time: 100, unit: 'SECONDS') {
                    input "Lambda Source Code Deployment ?"
                }
                script {
                    def AWS_PROFILE       = 'cd-sandbox'
                      sh "export AWS_PROFILE=cd-sandbox"
                      sh "aws lambda update-function-code --function-name lambda-automation-test --zip-file fileb://lambda-function.zip"
                }
            } 
        }
    }
  }
}
