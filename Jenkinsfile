pipeline {
    agent none
    stages {
        stage('dotnetCore') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
            }
            steps {
                sh 'dotnet --version'
            }
        }
        stage('TypeScript') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}