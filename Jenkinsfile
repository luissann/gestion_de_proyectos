pipeline {
    agent {
        docker {
            image 'ubuntu:latest'
            label ''
            registryUrl ''
            args '-u root' // Ejecuta el contenedor como root
        }
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
                    apt-get install -y sudo build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl libbz2-dev
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
                script {
                    sh """
                    # Asegúrate de que pytest esté instalado
                    python3.12 -m pip install pytest
                    # Ejecuta tus pruebas aquí
                    pytest
                    """
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

    // Puedes manejar acciones posteriores o manejar errores aquí
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
