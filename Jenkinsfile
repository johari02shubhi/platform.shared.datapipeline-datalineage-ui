pipeline {
    agent any

    tools {
        nodejs 'NodeJS 16.20.0' // Make sure NodeJS is configured in Jenkins Global Tool Configuration
    }

    environment {
        GIT_CREDENTIALS = credentials('b1d37b91-47fa-49be-b89f-240e2e1a61ff') // Jenkins credentials ID for GitHub
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature/test-cicd', url: 'git@github.com:johari02shubhi/platform.shared.datapipeline-datalineage-ui.git', credentialsId: "${GIT_CREDENTIALS}"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Run') {
            steps {
                sh 'npm start &'
            }
        }
    }

    post {
        success {
            echo 'Application deployed successfully!'
        }
        failure {
            echo 'Application deployment failed.'
        }
    }
}
