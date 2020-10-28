pipeline {
    agent none
    stages {
        stage('dotnetCore') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
            }
            environment {
                DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
            }
            steps {
                sh 'dotnet --version'
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('TypeScript') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                dir ("DotnetTemplate.Web") {
                    sh 'node --version'
                    sh 'npm install'
                    sh 'npm run build'
                    sh 'npm run lint'
                    sh 'npm t'
                 }
            }
        }
    }
}