pipeline {
    agent {
        docker {
            image 'ubuntu:latest'
            label '' // Puedes especificar un label si es necesario
            registryUrl '' // Dejar en blanco para DockerHub público
        }
    }
    stages {
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
    }
}
