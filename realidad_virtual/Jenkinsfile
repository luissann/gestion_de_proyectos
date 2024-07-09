pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "localhost:5000"
        MYSQL_DATABASE = 'mydatabase'
        MYSQL_USER = 'user'
        MYSQL_PASSWORD = 'password'
        MYSQL_ROOT_PASSWORD = 'rootpassword'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('my-django-app', '-f Dockerfile .')
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    docker.image('my-django-app').inside {
                        sh 'python manage.py test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            junit '**/reports/**/*.xml'
        }
    }
}
