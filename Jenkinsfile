pipeline {
    agent any
    environment {
        DOCKER_TAG = DockerTag()
        registry = "starseed777/simple-python"
        registryCredential = "dockerhub"
    }

    stages {

        stage("initialize docker to run commands") {
            Docker()
        }

        stage("Building skynet docker image") {
            steps {
                sh "docker build . -t starseed777/simple-python:${DOCKER_TAG}"
            }
        }

        stage("Pushing skynet image to public container registry") {
            steps {
                sh "docker push starseed777/simple-python:$DOCKER_TAG"
            }
        }

        stage("Check if skynet container works") {
            steps {
                sh "docker run simple-python"
            }
        }

    }
}

def Docker() {
    env.PATH = "${dockerHome}/bin:${env.PATH}"
}

def DockerTag() {
    def tag = sh script: "git rev-parse HEAD", returnStdout: true
    return tag 
}