# AWS Cloud Moodle Deployment

Deploying an open-source Moodle Learning Management System on **Amazon Web Services (AWS)** using **EC2**, **Ubuntu Linux**, **VPC**, **Security Groups**, **Elastic IP**, **Apache**, and **MySQL**.

## Project Overview

This project demonstrates the deployment of a Moodle Learning Management System (LMS) on Amazon Web Services (AWS) as part of my **Master of Information Technology (Advanced)** at Torrens University Australia.

The objective of this project was to gain practical experience in cloud infrastructure deployment by configuring a secure AWS environment, deploying a Linux-based web application, and applying cloud networking and security best practices.

The deployment includes creating a Virtual Private Cloud (VPC), configuring Security Groups, launching an Ubuntu EC2 instance, assigning an Elastic IP, installing Apache, PHP, and MySQL, and deploying Moodle for public access.

## Objectives

- Deploy Moodle on AWS EC2
- Configure Virtual Private Cloud (VPC)
- Configure Security Groups
- Launch an Ubuntu Linux EC2 instance
- Configure Elastic IP
- Install Apache Web Server
- Install MySQL Database
- Deploy Moodle
- Verify successful deployment

## Technologies Used

| Category | Technology |
|----------|------------|
| Cloud Platform | Amazon Web Services (AWS) |
| Compute | EC2 |
| Networking | VPC, Security Groups, Elastic IP |
| Operating System | Ubuntu Linux |
| Web Server | Apache |
| Database | MySQL |
| Application | Moodle |
| Version Control | Git & GitHub |

## Architecture

> *Architecture diagram will be added soon.*

## Deployment Workflow

```text
Create VPC
      │
      ▼
Configure Security Group
      │
      ▼
Launch Ubuntu EC2 Instance
      │
      ▼
Associate Elastic IP
      │
      ▼
Install Apache
      │
      ▼
Install MySQL
      │
      ▼
Deploy Moodle
      │
      ▼
Access Moodle via Browser
```

## Repository Structure

```
aws-cloud-moodle-deployment
│
├── README.md
├── architecture/
├── docs/
├── screenshots/
├── scripts/
└── assets/
```

## Screenshots

Screenshots demonstrating each deployment stage will be added, including:

- AWS VPC Configuration
- Security Group Configuration
- EC2 Instance
- Elastic IP
- Moodle Installation
- Moodle Dashboard

## Skills Demonstrated

- AWS EC2 Administration
- Cloud Infrastructure Deployment
- Linux System Administration
- Network Configuration
- Cloud Security
- Apache Configuration
- MySQL Administration
- Technical Documentation
- Troubleshooting
- Git Version Control

## Challenges & Solutions
| Challenge | Resolution |
|-----------|------------|
| Moodle installer failed with a form submission error. | Investigated the installation logs, identified PHP's `max_input_vars` limit as the cause, updated the configuration to `5000`, and restarted Apache. |
| Moodle installation required a manually created `config.php` file. | Interpreted the installer's error messages, manually created the configuration file, and configured the correct ownership and permissions before continuing the installation. |

## Future Improvements

Possible enhancements for a production-ready deployment include:

- Application Load Balancer (ALB)
- Amazon RDS
- HTTPS using AWS Certificate Manager
- Auto Scaling
- Amazon CloudWatch Monitoring
- Infrastructure as Code (Terraform or AWS CloudFormation)

## Author

**Tani Santi Dewi Jaya**

Master of Information Technology (Advanced)

Torrens University Australia
