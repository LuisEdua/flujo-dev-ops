pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio
                git 'https://github.com/LuisEdua/flujo-dev-ops.git'
            }
        }
        stage('Cleanup Docker') {
            steps {
                script {
                    // Detener y eliminar el contenedor si existe
                    sh '''
                    if [ $(docker ps -aq -f name=node-hello-world) ]; then
                        docker stop node-hello-world
                        docker rm node-hello-world
                    fi
                    '''
                    // Eliminar la imagen si existe
                    sh '''
                    if [ $(docker images -q node-hello-world) ]; then
                        docker rmi -f node-hello-world
                    fi
                    '''
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Construir la imagen Docker
                sh 'docker build -t node-hello-world .'
            }
        }
        stage('Run Docker Container') {
            steps {
                // Ejecutar el contenedor Docker
                sh 'docker run -d -p 3000:3000 --name node-hello-world node-hello-world'
            }
        }
    }

    post {
        always {
            // Eliminar el contenedor y la imagen después de la construcción si es necesario
            script {
                sh '''
                if [ $(docker ps -aq -f name=node-hello-world) ]; then
                    docker stop node-hello-world
                    docker rm node-hello-world
                fi
                if [ $(docker images -q node-hello-world) ]; then
                    docker rmi -f node-hello-world
                fi
                '''
            }
        }
    }
}
