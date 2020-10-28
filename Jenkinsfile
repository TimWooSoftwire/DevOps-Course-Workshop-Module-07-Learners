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
            stages{
                stage('Dotnet Build'){
                    steps{
                      sh 'dotnet build'
                      
                    }
                }
                stage('Dotnet Test'){
                    steps{
                        sh 'dotnet test'
                    }
                }
            }
        }
        stage('TypeScript') {
            agent {
                docker { image 'node:14-alpine' }
            }
            stages {
                stage('TypeScript build') {
                    steps {
                       dir ('DotnetTemplate.Web') {
                       sh 'node --version'
                       sh 'npm install'
                       sh 'npm run build'
                    }
                    }}
                stage('TypeScript linting') {
                        steps {
                    dir ('DotnetTemplate.Web') {
                            sh 'npm run lint'
                            }
                    }}
                stage('TypeScript tests') {
                        steps {
                    dir ('DotnetTemplate.Web') {
                           sh 'npm t'
                           slackSend color: "good", message: "Message from Jenkins Pipeline"
                           }
                       }}
                    }
                }
            }
        }
