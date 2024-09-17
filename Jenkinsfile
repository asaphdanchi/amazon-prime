pipeline {
    agent any

    environment {
        MAVEN_HOME = tool 'Maven'
    }

    stages {
        stage('Build') {
            steps {
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }

        stage('Deploy') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitlab-credentials', usernameVariable: 'GITLAB_USER', passwordVariable: 'GITLAB_TOKEN')]) {
                        sh "mvn deploy -DrepositoryId=gitlab -Durl=https://gitlab.com/api/v4/projects/YOUR_PROJECT_ID/packages/maven -Dmaven.test.skip=true"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment to GitLab Maven repository successful!'
        }
        failure {
            echo 'Build or deployment to GitLab Maven repository failed.'
        }
    }
}
