pipeline {
    agent none
    stages {
        stage('dotnetCore') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/core/sdk:3.1' }
            }
            environment {
                DOTNET_CLI_HOME = '/tmp/DOTNET_CLI_HOME'
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
            stages {
                stage('TypeScript build') {
                    dir ('DotnetTemplate.Web') {
                        steps {
                            sh 'node --version'
                            sh 'npm install'
                            sh 'npm run build'
                            }
                        }
                    }
                stage('TypeScript linting') {
                    dir ('DotnetTemplate.Web') {
                        steps {
                            sh 'npm run lint'
                            }
                       }
                    }
                stage('TypeScript tests') {
                    dir ('DotnetTemplate.Web') {
                        steps {
                           sh 'npm t'
                           }
                       }
                    }
                }
            }
        }
    }
