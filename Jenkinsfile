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
                    image 'ubuntu:latest' // Especifica la imagen de Docker que necesitas
                    args '-u root' // Opciones adicionales, si es necesario
                }
            }
            steps {
                script {
                    // Puedes ejecutar comandos dentro del contenedor Docker aquí
                    sh 'docker info' // Ejemplo de comando para verificar la conexión a Docker
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
