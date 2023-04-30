pipeline {
  agent any
  
    stages {
        stage('Build') {
            agent {
                label 'jenkins-master'
            }
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rizkypanz16/devops-test-rizkypanji']])
                sh 'ls'
                sh 'docker login 192.168.7.61:443 -u admin -p ijinmasuk'
                sh 'docker build -t 192.168.7.61:443/laraveltest:develV1 -f Dockerfile-dev .'
				sh 'docker build -t 192.168.7.61:443/laraveltest:staggedV1 -f Dockerfile-prod .'
				sh 'docker tag 192.168.7.61:443/laraveltest:staggedV1 192.168.7.61:443/laraveltest:prodV1'
                sh 'docker push 192.168.7.61:443/laraveltest:develV1'
				sh 'docker push 192.168.7.61:443/laraveltest:staggedV1'
				sh 'docker push 192.168.7.61:443/laraveltest:prodV1'
                echo 'Start Build'
                echo 'Build successfully'
            }
        }
        stage('Deploy'){
            agent {
                label 'kube1'
            }
            steps {
				echo 'Start Deploying app'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rizkypanz16/devops-test-rizkypanji']])
                sh 'ls'
                sh 'kubectl apply -f kubernetes-manifest-devel.yaml'
				sh 'kubectl apply -f kubernetes-manifest-stagged.yaml'
				sh 'kubectl apply -f kubernetes-manifest-prod.yaml'
                echo 'Deploy successfully'
            }
        }
    }
}