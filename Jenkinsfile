pipeline {
    agent any

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
                    args '-u root' // Opciones adicionales, si es necesario
                }
            }
            steps {
                script {
                    sh 'docker info' // Comando para verificar la conexión a Docker
                }
            }
        }

        // Agrega más etapas según sea necesario

        stage('Final') {
            steps {
                echo "¡Hola Mundo!"
            }
        }
    }
}
