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
			sh 'echo "Building image"'
			sh './docker_run.sh'
		}
		stage('Push image') {
			sh './docker_upload.sh'
		}
		stage('set current kubectl context') {
			sh 'echo "Pending context"'
		}
		stage('Deploy container') {
			sh 'echo "Pending deploy"'
		}
	}
}

