pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('1fe75ff7-3325-4fbb-927d-788a3461e268')
        DOCKER_IMAGE = 'sidharthsingh7/ss_backend'
        DOCKER_TAG = "0.0.1.RELEASE"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '1fe75ff7-3325-4fbb-927d-788a3461e268') {
                        def customImage = docker.image("$DOCKER_IMAGE:$DOCKER_TAG")
                        customImage.push()
                    }
                }
            }
        }
    }
}
