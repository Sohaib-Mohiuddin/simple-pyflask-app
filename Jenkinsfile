def docker_build_push

pipeline {
    environment {
        DOCKERHUB_REPO = 'sohaibm'
        IMAGE_NAME = 'simple-pyflask-app'
        VERSION = '1.0'
    }
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // clone git repo into workspace
                echo 'Cloning Repository'
                checkout scm
            }
        }
        stage("Build Image: ${IMAGE_NAME}:${VERSION}") {
            steps {
                echo 'Building Image'
                script {
                    docker_build_push = docker.build("${DOCKERHUB_REPO}/${IMAGE_NAME}:${VERSION}", '.')
                }
                echo 'Building Image - Complete'
            }
        }
        stage("Push Image: ${DOCKERHUB_REPO}/${IMAGE_NAME}:${VERSION}") {
            steps {
                echo 'Pushing Image'
                script {
                    docker.withRegistry('', 'DockerHub') {
                        docker_build_push.push()
                    }
                }
            }
        }
        stage("Prune Dangling Container/Image") {
            steps {
                echo 'Pruning Containers'
                sh "docker container prune -f"
                echo 'Pruning Images'
                sh "docker image prune -f"
                echo 'Pruning Complete'
            }
        }
    }
}