pipeline{
	agent any
	stages{
		stage ('Build'){
			steps{
				sh 'echo "Hello World, starting pipeline"'
				sh'''
					echo "Multiline shell steps works too"
					ls -lah
				'''
			}
		}
		stage('Build image') {
			steps{
				sh 'echo "Building image"'
				sh './docker_run.sh'
			}
		}
		stage('Push image') {
			steps{
				withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
					sh './docker_upload.sh'
				}
			}
		}
		stage('set current kubectl context') {
			steps{
				withAWS(region:'us-east-2',credentials:'aws_access_key_id') {
					sh '''
					aws eks --region us-east-2 update-kubeconfig --name prod
					kubectl config use-context arn:aws:eks:us-east-2:223008900821:cluster/prod
					'''
				}
			}
		}
		stage('Deploy controller') {
			steps{
				sh 'kubectl apply -f ./controller.yaml'
			}
		}
		stage('Create services') {
			steps{
				sh 'kubectl apply -f ./service.yaml'
			}
		}
		stage('Clean') {
			steps{
				sh './docker_clean.sh'
			}
		}
	}
}

