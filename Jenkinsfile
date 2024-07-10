pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-docker-image'
        MYSQL_ROOT_PASSWORD = 'rootpassword'
        MYSQL_DATABASE = 'mydatabase'
        MYSQL_USER = 'user'
        MYSQL_PASSWORD = 'password'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Obteniendo el código del repositorio...'
                git 'https://github.com/luissann/gestion_de_proyectos.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Construyendo la imagen Docker...'
                script {
                    docker.withServer('tcp://docker-host:2376') {
                        def customImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                        customImage.push()
                    }
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Ejecutando pruebas...'
                script {
                    docker.withServer('tcp://docker-host:2376') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").inside {
                            sh 'python manage.py test'
                        }
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Desplegando la aplicación...'
                script {
                    docker.withServer('tcp://docker-host:2376') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").run("-p 8080:8080 --name my-container -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -e MYSQL_DATABASE=${MYSQL_DATABASE} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD}")
                    }
                }
            }
        }

        stage('Final') {
            steps {
                echo '¡Hola mundo!'
                // En esta etapa final, muestra el mensaje "Hola mundo".
            }
        }
    }
}
