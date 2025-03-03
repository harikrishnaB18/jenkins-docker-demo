pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "haribhk/myapp"
    }
    stages {
        stage("Checkout Code") {  // Replaced "Clone Repository" with "Checkout Code"
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']], // Replace 'main' with your branch if different
                    userRemoteConfigs: [[url: 'https://github.com/harikrishnaB18/jenkins-docker-demo.git']]
                ])
            }
        }
        stage("Build Docker Image") {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }
        stage("Push Docker Image") {
            steps {
                withDockerRegistry([credentialsId: "dockerhub", url: ""]) {
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }
        stage("Deploy Container") {
            steps {
                sh "docker run -d -p 80:80 $DOCKER_IMAGE"
            }
        }
    }
}
