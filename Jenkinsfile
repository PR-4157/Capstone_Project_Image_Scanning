pipeline {

    agent any

    stages {

        stage('Build') {
            steps {
                sh 'docker build -t scanner .'
            }
        }

        stage('Security Scan') {
            steps {
                sh './scripts/scan.sh scanner'
            }
        }

    }

}