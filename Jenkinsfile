pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['deploy', 'destroy'], description: 'Choose whether to deploy or destroy the infrastructure')
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-credentials') // Replace with Jenkins credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials') // Replace with Jenkins credential ID
        TF_VAR_region = 'eu-west-2' // Set your AWS region
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'git@github.com:satishgonella2024/three-tier-app.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'deploy') {
                        sh 'terraform plan'
                    } else if (params.ACTION == 'destroy') {
                        sh 'terraform plan -destroy'
                    }
                }
            }
        }
        stage('Execute Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'deploy') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.ACTION == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
        stage('Test Deployment') {
            when {
                expression { params.ACTION == 'deploy' }
            }
            steps {
                script {
                    echo "Testing the deployment..."
                    def albDns = sh(script: "terraform output -raw alb_dns_name", returnStdout: true).trim()
                    echo "ALB DNS Name: ${albDns}"
                    def testResponse = sh(script: "curl -s http://${albDns}", returnStdout: true).trim()
                    echo "Test Response: ${testResponse}"

                    if (testResponse.contains("Hello from")) {
                        echo "Test Passed: Application is responding as expected."
                    } else {
                        error "Test Failed: Unexpected response from the application."
                    }
                }
            }
        }
    }
    post {
        success {
            echo 'Terraform action completed successfully!'
        }
        failure {
            echo 'Terraform action failed. Please check the logs.'
        }
    }
}
