pipeline {
    agent any

    tools {
        maven "Maven3"
    }

    environment {
        IMAGE_NAME = "webapp"
        CONTAINER_NAME = "java-web"
        APP_PORT = "8080"
        HOST_PORT = "9090"
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: "main", url: "https://github.com/torkhaniabir/webapp-java.git"
            }
        }

        stage("Run Tests") {
            steps {
                sh "mvn test"
            }
        }

        stage("Build with Maven") {
            steps {
                sh "mvn clean package"
                sh "cp target/demo-1.0.0.jar target/app.jar"
            }
        }

        // 🔽 هذا هو Stage Build Docker Image
        stage("Build Docker Image") {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        // 🔽 مباشرة بعدو تحط Stage Run Docker Container
        stage("Run Docker Container") {
            steps {
                sh "docker rm -f ${CONTAINER_NAME} || true"
                sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${APP_PORT} ${IMAGE_NAME}:latest"
            }
        }
    }
}

