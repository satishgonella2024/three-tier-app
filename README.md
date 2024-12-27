🚀 Three-Tier Web Application on AWS with Terraform

Automate AWS infrastructure like a pro! This repository contains Terraform configurations to deploy a scalable, fault-tolerant, and production-ready three-tier web application on AWS.

📜 Project Overview

The Three-Tier Architecture separates an application into three layers:
	1.	Presentation Layer: A web server that handles user interactions.
	2.	Application Layer: Processes requests using EC2 instances with Auto Scaling.
	3.	Database Layer: Manages data storage with RDS.

🛠 Features
	•	Scalable Architecture: Auto Scaling for EC2 instances to handle high demand.
	•	High Availability: Deployed across multiple Availability Zones.
	•	Load Balancing: Application Load Balancer (ALB) for efficient traffic distribution.
	•	Network Isolation: Public and private subnets in a Virtual Private Cloud (VPC).
	•	Infrastructure as Code (IaC): Fully automated with Terraform.

🗂 Project Structure

three-tier-app/
├── main.tf            # Core Terraform configuration
├── variables.tf       # Input variables for modularity
├── outputs.tf         # Outputs like ALB DNS name
├── terraform.tfvars   # Input variable values
└── .gitignore         # Ignored files (e.g., Terraform state)

🧑‍💻 Getting Started

Prerequisites
	1.	Terraform: Install Terraform.
	2.	AWS CLI: Install AWS CLI.
	3.	Git: Install Git.
	4.	AWS account credentials configured in ~/.aws/credentials.

Clone the Repository

git clone git@github.com:satishgonella2024/three-tier-app.git
cd three-tier-app

Deployment Steps
	1.	Initialize Terraform:

terraform init


	2.	Preview the Deployment:

terraform plan


	3.	Deploy the Infrastructure:

terraform apply -auto-approve


	4.	Access the Application:
Retrieve the ALB DNS name:

terraform output alb_dns_name

Test the application:

curl http://<alb_dns_name>

You should see:
Hello from <hostname>

🌐 Architecture Diagram

📦 Modules and Resources
	•	VPC Module: Creates a Virtual Private Cloud (VPC) with public and private subnets.
	•	ALB: Handles incoming traffic and routes it to EC2 instances.
	•	Auto Scaling Group (ASG): Manages EC2 instances dynamically.
	•	RDS: A placeholder for database configuration (extendable).

📖 Learn More
	•	Terraform Documentation
	•	AWS Three-Tier Architecture Guide

🤝 Contributing

We welcome contributions! To get started:
	1.	Fork the repository.
	2.	Create a feature branch: git checkout -b my-feature.
	3.	Commit your changes: git commit -m "Add feature".
	4.	Push the branch: git push origin my-feature.
	5.	Open a Pull Request.

📂 GitHub Repository

Explore the project and contribute here:
Three-Tier Web Application Repository

⚙️ Future Enhancements
	•	Add HTTPS with AWS Certificate Manager (ACM).
	•	Integrate RDS for database functionality.
	•	Enable CloudWatch monitoring and alarms.

📝 License

This project is licensed under the MIT License.

💬 Feedback

Have questions or feedback? Connect with me on LinkedIn or raise an issue in the repository. Together, let’s build the future of cloud infrastructure! 🚀
