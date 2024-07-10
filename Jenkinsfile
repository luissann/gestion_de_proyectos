pipeline {
    agent any
    
    environment {
        PYTHON_EXECUTABLE = "${tool name: 'python', type: 'hudson.plugins.python.PythonInstallation'}/bin/python3"
        NODEJS_HOME = "${tool name: 'nodejs', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'}/bin"
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
                sh "npm install"  // Ensure npm packages are installed
                sh "npm run build"
                sh "npm run deploy"
            }
        }
        
        stage('Final') {
            steps {
                echo "Pipeline finished"
            }
        }
    }
    
    // Optional: Handle post-actions or error handling here
}
