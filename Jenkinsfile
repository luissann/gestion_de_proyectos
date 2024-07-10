pipeline {
    agent any

    environment {
        // Define la versión de Python configurada en Jenkins
        PYTHON_VERSION = '3.12.3'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Docker Environment') {
            agent {
                docker {
                    image 'ubuntu:latest'
                    args '-u root' // Ejecuta el contenedor como root si es necesario
                }
            }
            steps {
                script {
                    // Instala Docker dentro del contenedor (si no está instalado)
                    sh '''
                    apt-get update
                    apt-get install -y docker.io
                    '''
                    // Loguearse en Docker (si es necesario)
                    withDockerRegistry(credentialsId: 'docker-credentials', url: 'https://index.docker.io/v1/') {
                        sh 'docker login -u luissann -p ********'
                    }
                }
            }
        }

        stage('Download Python') {
            steps {
                script {
                    sh '''
                    curl -O https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
                    tar -xvf Python-3.12.3.tgz
                    cd Python-3.12.3
                    ./configure --enable-optimizations
                    make -j 8
                    make altinstall
                    '''
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh '''
                    # Asegúrate de que pytest esté instalado
                    python3.12 -m pip install pytest
                    # Ejecuta tus pruebas aquí
                    pytest
                    '''
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                echo 'Construyendo y desplegando la aplicación...'
            }
        }

        stage('Final') {
            steps {
                echo "¡Hola Mundo!"
            }
        }
    }

    // Maneja acciones posteriores o errores aquí
    post {
        always {
            echo 'Limpieza final...'
        }
        success {
            echo 'Pipeline ejecutada con éxito'
        }
        failure {
            echo 'Pipeline fallida'
        }
    }
}
