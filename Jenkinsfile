pipeline {
    agent any
    stages {
        stage('Prepare stag env') {
            steps {
                script {
                     try {
                         sh "docker rm -f konga konga-mongo kong kong-postgres"
                     } catch (err) {
                         echo err
                     }
                 }
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
            sh "docker system prune -f"
       }
    }
}
