pipeline {
    agent any
    stages {
        stage('Prepare stag env') {
            steps {
                sh "docker rm -f konga konga-mongo kong kong-postgres"
            }
        }
        stage('Build') {
            steps {
                sh "docker-compose build"
            }
        }
        stage('Deploy to stag') {
            steps {
                sh "docker-compose -p kong-stag up -d --force-recreate"
            }
        }
    }
    post {
       always {
            sh "docker-compose down --rmi='all'"
            sh "docker system prune -f"
       }
    }
}
