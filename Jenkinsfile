pipeline {
    agent any

    tools {
        nodejs 'NodeJS 16.20.0' // Make sure NodeJS is configured in Jenkins Global Tool Configuration
    }

    environment {
        GIT_CREDENTIALS = credentials('github') // Jenkins credentials ID for GitHub
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/johari02shubhi/platform.shared.datapipeline-datalineage-ui.git', credentialsId: "${GIT_CREDENTIALS}"
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
