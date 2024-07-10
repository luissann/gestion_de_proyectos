pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    def pythonExecutable = sh(script: 'which python3', returnStdout: true).trim()
                    echo "Python executable found at: ${pythonExecutable}"
                    sh "${pythonExecutable} -m pip install -r requirements.txt"
                }
            }
        }
        
        // Agrega más etapas según sea necesario
        
        stage('Run Tests') {
            steps {
                // Ejemplo de ejecución de pruebas
                sh "pytest"
            }
        }
        
        stage('Build and Deploy') {
            steps {
                // Ejemplo de construcción y despliegue
                sh "npm run build"
                sh "npm run deploy"
            }
        }
        
        stage('Final') {
            steps {
                // Etapa final
                echo "Pipeline finished"
            }
        }
    }
    
    // Opcionalmente, puedes definir post-actions o manejo de errores aquí
}
