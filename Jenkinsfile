pipeline {
    agent any
    environment {
        DOCKER_TAG = DockerTag()
        registry = "starseed777/simple-python"
        registryCredential = "dockercredentials"
    }

    stages {

        stage("Building skynet docker image") {
            steps {
                sh "docker build . -t starseed777/simple-python:${DOCKER_TAG}"
            }
        }

        stage("Pushing skynet image to public container registry") {
            steps {

                withDockerRegistry(credentialsId: 'dockercredentials', url: '') {
                    sh "docker push starseed777/simple-python:$DOCKER_TAG"
                }
            }
        }

        stage("pull image locally") {
            steps {
                sh "docker pull starseed777/simple-python"
            }
        }

        stage("test if image can be run in a container") {
            steps {
                sh "docker run starseed777/simple-python"
            }
        }

    }
}


def DockerTag() {
    def tag = sh script: "git rev-parse HEAD", returnStdout: true
    return tag 
}