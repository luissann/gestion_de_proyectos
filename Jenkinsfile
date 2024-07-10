pipeline {
    agent any
    
    environment {
        PYTHON_EXECUTABLE = "${tool name: 'python', type: 'hudson.plugins.python.PythonInstallation'}/bin/python3"
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
                    def pythonExecutable = "${env.PYTHON_EXECUTABLE}"
                    echo "Python executable found at: ${pythonExecutable}"
                    sh "${pythonExecutable} -m pip install -r requirements.txt"
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                sh "pytest"
            }
        }
        
        stage('Build and Deploy') {
            steps {
                // Aquí podrías incluir los pasos de construcción y despliegue específicos
                // según lo que necesites, como construir tu aplicación Angular o cualquier otro paso necesario.
            }
        }
        
        stage('Final') {
            steps {
                echo "Hola Mundo"
            }
        }
    }
    
    // Opcionalmente, puedes manejar acciones posteriores o manejo de errores aquí
}
