pipeline {
    agent any

    environment {
        // You can set environment variables here if needed
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git url: 'https://github.com/himnishisrani/devopstest.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the project (adjust based on your tech stack)
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                // Run tests if any
                sh 'npm test'
            }
        }

        stage('Deploy to Firebase') {
            steps {
                // Deploy to Firebase Hosting
                sh 'firebase deploy --token $FIREBASE_TOKEN --only hosting'
            }
        }
    }

    post {
        success {
            echo 'Deployed successfully!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
