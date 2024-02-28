# 🚀 DevOps Challenge Series: Revolutionizing Node.js Deployment on AWS! 🛠️

# AUTOMATION FUELS INNOVATION

Welcome to part 3 of our ongoing DevOps Challenge Series where we navigate through real-world DevOps challenges with finesse and innovation.

## Challenge Overview:

1. **Elevate Your Node.js Game:** Deploy your Node.js application effortlessly onto AWS EC2 instances.
2. **Balancing Act:** Harness the power of AWS Load Balancer to distribute your app's load seamlessly, ensuring uninterrupted service.
3. **Auto-Scaling Agility:** Let AWS Auto Scaling dynamically adjust your app's capacity based on CPU metrics, ensuring optimal resource utilization.
4. **One Push, Infinite Possibilities:** Automate the entire deployment process! A single push to your version control branch triggers a cascade of infrastructure and software deployment, empowering you to focus on innovation.

## Bonus Challenge:

1. **Golden AMI Creation:** Craft a custom image with your Node.js app preconfigured. Launch EC2 instances from this Golden AMI for swift and consistent deployment.
2. **Streamlined Auto Scaling Group:** Configure Auto Scaling to launch instances from a predefined launch template using the Golden AMI. Reduce setup time and enhance scalability seamlessly.


### Tech Stacks/Prerequisites:

- **Node.js:** To build the application.
- **AWS:**
    - **EC2:** The application is deployed to EC2 instances on AWS.
    - **Application Load Balancer:** To efficiently distribute incoming application traffic across multiple targets (EC2) for improved availability.
    - **Auto Scaling Group:** Enables automatic scaling of compute resources in response to changes in demand or conditions.
- **Packer:** Used to build our golden AMI.
- **Ansible:** Used by Packer to configure the Node.js application on the golden AMI.
- **Terraform:** Used to configure our infrastructure on AWS.

## Directory Guide

1. api/: this directory contains the node.js application
2. devops/: this is where the magic happens
    - ansible/:
        - ansible.cfg: contains the ansible configurations to be used for this workflow
        - env.example: sample file containing environment variable keys
        - myinventory/: contains ansible inventory information for local development
        - playbooks/:
            - syspackages.yml: contains plays to install dependencies needed to configure the application on the EC2 instance
            - clonerepo.yml: contains plays to clone the application code from github, and install dependencies
            - startapp.yml: contains plays to start the node.js application
    
    - packer/: 
        - packer


