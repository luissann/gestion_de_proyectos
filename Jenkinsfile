pipeline {
    agent any
    
    environment {
        // Define el nombre de la herramienta de Python configurada en Jenkins
        PYTHON_VERSION = 'Python3.12.0'
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
                    // Utiliza la herramienta de Python configurada en Jenkins
                    def pythonExecutable = tool name: "${env.PYTHON_VERSION}", type: 'hudson.plugins.python.PythonInstallation'
                    echo "Python executable found at: ${pythonExecutable}"
                    sh "${pythonExecutable}/bin/python -m pip install -r requirements.txt"
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
                echo "Hola Mundo"
            }
        }
    }
    
    // Puedes manejar acciones posteriores o manejo de errores aquí
}
