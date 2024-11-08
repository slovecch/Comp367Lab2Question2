pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'slovecch/comp367webapp'
        DOCKER_HUB_CREDENTIALS = '102328bc-d2ff-4ef8-86be-0ad398bb3c14'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from GitHub
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the project using Maven
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run tests using Maven
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Package the WAR file
                sh 'mvn package'
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archive the built artifacts
                archiveArtifacts artifacts: 'target/*.war', allowEmptyArchive: true
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS_ID, usernameVariable: 'DOCKER_PASS')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    }                    
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}"
                    sh "docker build -t ${imageName} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def imagineName = "${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}"
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        sh "docker push ${imagineName}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build, Docker image creation and push to Docker Hub successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
