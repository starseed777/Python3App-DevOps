pipeline {
    agent any
    environment {
        DOCKER_TAG = DockerTag()
        registry = "starseed777/simple-python"
        registryCredential = "dockerhub"

    }

    stages {
        stage("Building docker image from skynet package") {
            steps {
                sh "docker build . -t starseed777/simple-python:${DOCKER_TAG}"
            }
        }

        stage("Push built image to dockerhub") {
            steps {
                script{
                   docker.withRegistry("",registryCredential) {
                    sh "docker push starseed777/simple-python:$DOCKER_TAG"
                   } 
                }
            }
        }

        stage("Check if skynet works") {
            steps {
                sh "docker run skynet"
            }
        }

def DockerTag() {
    def tag = sh script: "git rev-parse HEAD", returnStdout: true
    return tag 
}