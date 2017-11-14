pipeline {
  agent {
    minikube {
      label 'jnlp-agent'
      containerTemplate {
        name 'ruby'
        image 'ruby:2.4.2-jessie'
        ttyEnabled true
        command 'ruby -v'
      }
    }
  }
}
