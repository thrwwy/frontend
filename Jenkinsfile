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


podTemplate(label: 'docker', cloud: 'minikube',
  containers: [containerTemplate(name: 'docker', image: 'docker:stable-dind', ttyEnabled: true, command: 'cat')],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]
  ) {

  def image = "192.168.99.1:5555/frontend:${BUILD_NUMBER}"
  node('docker') {
    stage('Build Docker image') {
      container('docker') {
        git 'https://github.com/thrwwy/frontend.git'
        sh "docker version"
        sh "sleep 600"
        sh "docker build -t ${image} ."
        sh "docker -help"
        sh "ls -latr"
      }
    }
  }
}
