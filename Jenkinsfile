pipeline {
    agent any

    environment {
        // Replace with the IP or DNS of your EC2 instance
        EC2_HOST = '13.201.85.190'
        // Replace with your SSH username for the EC2 instance (e.g., ec2-user)
        EC2_USER = 'ec2-user'
        // The private key used to SSH into the EC2 instance (add this key in Jenkins credentials)
        SSH_CREDENTIALS_ID = 'your-ssh-credentials-id'
        // Replace with the location where you want to deploy the application on EC2
        DEPLOY_DIR = '/home/ec2-user/'
    }

    triggers {
        // Polls GitHub every minute for changes. You can also set up GitHub webhooks for more immediate triggers.
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git url: 'https://github.com/himnishisrani/devopstest.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies (adjust this based on your project type, e.g., npm for Node.js)
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the project (adjust this for your project, e.g., npm build, Maven, etc.)
                sh 'npm run build'
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    // Deploy the built files to the EC2 instance via SCP
                    sshagent([SSH_CREDENTIALS_ID]) {
                        sh """
                        scp -o StrictHostKeyChecking=no -r ./build ${EC2_USER}@${EC2_HOST}:${DEPLOY_DIR}
                        ssh ${EC2_USER}@${EC2_HOST} "sudo systemctl restart your-app-service"
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
