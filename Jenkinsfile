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
  containers: [containerTemplate(name: 'docker', image: 'docker:17.10.0-ce', ttyEnabled: true, command: 'cat')],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')]
  ) {

  def image = "192.168.99.1:5555/frontend"
  node('docker') {
    stage('Build Docker image') {
      git 'https://github.com/thrwwy/frontend.git'
      container('docker') {
        sh "docker build -t ${image} ."
      }
    }
  }
}
