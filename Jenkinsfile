pipeline {
    agent any
    stages {
        stage('Deploy to stag') {
            steps {
                catchError {
                    sh "docker-compose down"
                    sh "docker-compose -p kong-stag up -d --build --force-recreate"
                    sh "./registerCert.sh"
                }
            }
        }
    }
    post {
       always {
            sh "docker system prune -f"
       }
       failure {
            sh "docker rm -f konga konga-mongo kong kong-postgres"
       }
    }
}
