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
                    def DEPLOY_ROLE       = 'arn:aws:iam::221283034294:role/deploy_role'
                      sh "source ci/assume_role.sh ${DEPLOY_ROLE} ${AWS_PROFILE}"
                }
            } 
        }
    }
}