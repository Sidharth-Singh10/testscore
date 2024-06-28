pipeline {
      agent any
    environment {
        // DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
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
                    // Log in to Docker Hub
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
    }
}
