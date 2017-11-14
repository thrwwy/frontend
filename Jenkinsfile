// pipeline {
//   agent {
//     any {
//       label 'jnlp-agent'
//       containerTemplate {
//         name 'ruby'
//         image 'ruby:2.4.2-jessie'
//         ttyEnabled true
//         command 'ruby -v'
//       }
//     }
//   }
//   stages {
//     stage('Run ruby') {
//       steps {
//         container('ruby') {
//           sh 'ruby -v'
//         }
//       }
//     }
//   }
// }

/**
 * This pipeline will run a Docker image build
 */

podTemplate(label: 'docker',
  containers: [containerTemplate(name: 'docker', image: 'docker:1.11', ttyEnabled: true, command: 'cat')],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]
  ) {

  def image = "jenkins/jnlp-slave"
  node('docker') {
    stage('Build Docker image') {
      git 'https://github.com/jenkinsci/docker-jnlp-slave.git'
      container('docker') {
        sh "docker build -t ${image} ."
      }
    }
  }
}
