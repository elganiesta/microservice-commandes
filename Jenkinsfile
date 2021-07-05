pipeline{

    environment {
        registry = "elganiesta/mcommandes"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    agent any

    stages{
        stage("Maven build"){
            steps{
                echo "======== Maven build ========"
                sh "mvn install -Dmaven.test.skip=true"
            }
        }
        stage("Docker build"){
            steps{
                echo "======== Docker build ========"
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage("Docker deploy"){
            steps{
                echo "======== Docker deploy ========"
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage("Kubernetes deploy"){
            steps{
                echo "======== Kubernetes deploy ========"
                // def remote = [:]
                // remote.name = '<name>'
                // remote.host = '<host>'
                // remote.user = '<user>'
                // remote.password = '<password>'
                // remote.allowAnyHosts = true

                // sshPut remote: remote, from: 'deployment.yml', into: '.'
                // sshCommand remote: remote, command: "kubectl apply -f deployment.yml"
            }
        }
    }
    post{
        success{
            echo "======== pipeline executed successfully ========"
        }
        failure{
            echo "======== pipeline execution failed========"
        }
    }
}