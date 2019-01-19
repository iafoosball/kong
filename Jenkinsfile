pipeline {
    agent any
    stages {
        stage('Prepare stag env') {
            steps {
                sh "docker stop konga"
                sh "docker stop konga-mongo"
                sh "docker stop kong"
                sh "docker stop kong-postgres"
                sh "docker rm konga"
                sh "docker rm konga-mongo"
                sh "docker rm kong"
                sh "docker rm kong-postgres"
            }
        }
        stage('Build') {
            steps {
                sh "docker-compose build"
            }
        }
        stage('Deploy to stag')
            steps {
                sh "docker-compose -p kong-stag up -d --force-recreate"
            }
    }
    post {
       always {
            sh "docker system prune -f"
            sh "docker-compose down --rmi='all'"
       }
    }
}
