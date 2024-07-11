pipeline {
    agent any

    environment {
        IMAGE = "web"
        DOCKERFILE_PATH = "/var/lib/jenkins/workspace/gps/dockerfile"
        SSH_USER = 'ec2-user'
        SSH_HOST = 'ec2-18-216-248-159.us-east-2.compute.amazonaws.com' 
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'bac975d5-b037-41e7-a3bc-02c215a86f90', url: 'https://github.com/luissann/gestion_de_proyectos.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    docker.build(IMAGE, "-f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Update') {
            steps {
                sshagent(['78299390-90dc-4ac8-8c27-73328ee68d4f']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} << EOF
                    cd gps/gestion_de_proyectos
                    git fetch
                    git stash
                    git pull
                    docker-compose down
                    docker-compose build
EOF
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['78299390-90dc-4ac8-8c27-73328ee68d4f']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} << EOF
                    cd gps/gestion_de_proyectos
                    docker-compose up -d
EOF
                    """
                }
            }
        }
    }
}
