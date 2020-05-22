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
				sh 'echo "Pending context"'
			}
		}
		stage('Deploy container') {
			steps{
				sh 'echo "Pending deploy"'
			}
		}
	}
}

