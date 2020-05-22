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
				sh './docker_upload.sh'
			}
		}
		stage('set current kubectl context') {
			steps{
				withAWS(region:'us-east-2',credentials:'aws_access_key_id') {
					//sh 'kubectl config use-context arn:aws:eks:us-east-2:223008900821:cluster/prod'
				}
			}
		}
		stage('Deploy container') {
			steps{
				sh './kubernetes_run.sh'
			}
		}
		stage('Clean') {
			steps{
				sh './docker_clean.sh'
			}
		}
	}
}

