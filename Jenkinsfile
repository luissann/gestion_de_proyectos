pipeline {
    agent any

    environment {
        IMAGE = "web"
        DOCKERFILE_PATH = "/var/lib/jenkins/workspace/gps/dockerfile"
        SSH_USER = 'ec2-user' // Reemplaza con el nombre de usuario correctoo
        SSH_HOST = 'ec2-18-216-248-159.us-east-2.compute.amazonaws.com' // Reemplaza con la IP o el hostname de la instancia de aplicación
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

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-user']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-user@ec2-18-216-248-159.us-east-2.compute.amazonaws.com << EOF
                    cd gps/gestion_de_proyectos
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install -r requirements.txt
                    EOF
                    '''
                }
            }
        }

        stage('Run Tests') {
            steps {
                sshagent(['78299390-90dc-4ac8-8c27-73328ee68d4f']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} << EOF
                    cd gps/gestion_de_proyectos
                    source venv/bin/activate
                    python3.9 manage.py test
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
