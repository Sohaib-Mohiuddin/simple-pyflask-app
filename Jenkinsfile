def docker_build_push

pipeline {
    environment {
        DOCKERHUB_REPO = 'sohaibm' // Change if pushing to different Repository
        IMAGE_NAME = 'simple-pyflask-app'
        VERSION = '1.1' // Increment as such: Major_Version:Minor_Version
    }
    agent any
    stages {
        // stage('Clone Repository') not needed anymore. Jenkins automatically does 'checkout scm'
        
        stage('Build Image') {
            steps {
                echo 'Building Image'
                script {
                    docker_build_push = docker.build("${DOCKERHUB_REPO}/${IMAGE_NAME}:${VERSION}", '.')
                }
                echo 'Building Image - Complete'
            }
        }
        stage('Push Image') {
            steps {
                echo 'Pushing Image'
                script {
                    docker.withRegistry('', 'DockerHub') {
                        docker_build_push.push()
                    }
                }
                echo 'Pushing Image - Complete'
            }
        }
        stage('Prune Dangling Container/Image') {
            steps {
                echo 'Pruning Containers'
                sh "docker container prune -f"
                echo 'Pruning Images'
                sh "docker image prune -f"
                echo 'Pruning - Complete'
            }
        }
    }
}