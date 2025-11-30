pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'YOUR_REPO_URL'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn -B clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t webapp:latest .'
            }
        }

        stage('Run App') {
            steps {
                sh 'docker stop java-web || true'
                sh 'docker rm java-web || true'
                sh 'docker run -d -p 8080:8080 --name java-web webapp:latest'
            }
        }
    }
}
