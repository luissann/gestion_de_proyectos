pipeline {
    agent any
    
    environment {
        // Define el nombre de la herramienta de Python configurada en Jenkins
        PYTHON_VERSION = 'Python3.12.3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    sh """
                    apt-get update
                    apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl libbz2-dev
                    """
                }
            }
        }
        stage('Download Python') {
            steps {
                script {
                    sh """
                    curl -O https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
                    tar -xvf Python-3.12.3.tgz
                    cd Python-3.12.3
                    ./configure --enable-optimizations
                    make -j 8
                    make altinstall
                    """
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                // Ejecuta tus pruebas aquí, por ejemplo:
                sh "pytest"
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
    
    // Puedes manejar acciones posteriores o manejar errores aquí
}
