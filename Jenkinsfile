pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Obteniendo el código del repositorio...'
                git credentialsId: '2d157467-0cf7-4109-9bcc-56c35b34e353', url: 'https://github.com/luissann/gestion_de_proyectos.git', branch: 'main'
            }
        }

        stage('Check Python Version') {
            steps {
                sh '''
                /usr/bin/python3 --version
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Instalando dependencias...'
                sh '''
                /usr/bin/python3 -m pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Ejecutando pruebas...'
                sh '''
                /usr/bin/python3 manage.py test
                '''
            }
        }

        stage('Build and Deploy') {
            steps {
                echo 'Construyendo y desplegando la aplicación...'
                // Aquí puedes incluir comandos para construir y desplegar tu aplicación si es necesario
            }
        }

        stage('Final') {
            steps {
                echo '¡Hola mundo!'
            }
        }
    }
}
