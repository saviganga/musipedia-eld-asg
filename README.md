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

1. **api/:** This directory contains the Node.js application.
2. **devops/:** This is where the magic happens.
    - **ansible/:**
        - `ansible.cfg`: Contains the Ansible configurations for this workflow.
        - `env.example`: Sample file containing environment variable keys.
        - `myinventory/`: Contains Ansible inventory information for local development.
        - `playbooks/`:
            - `syspackages.yml`: Plays to install dependencies needed to configure the application on the EC2 instance.
            - `clonerepo.yml`: Plays to clone the application code from GitHub and install application dependencies.
            - `startapp.yml`: Plays to start the Node.js application.
    - **packer/:** 
        - `variables.pkr.hcl`: Contains variables for the Packer configuration.
        - `packer.pkr.hcl`: Contains configurations to provision the golden AMI.
    - **terraform/:**
        - `providers.tf`: Declares the providers that Terraform will use, and defines the backend where Terraform will store the state of our infrastructure.
        - `vars.tf`: Contains variables for the Terraform configuration.
        - `key_pair.tf`: Contains Terraform configurations to provision a key pair for SSH access to EC2 instances.
        - `security_group.tf`: Contains Terraform configurations to provision ingress and egress rules for the application infrastructure.
        - `instance.tf`: Contains Terraform configurations to fetch the latest version of the golden AMI created by Packer and provision an EC2 launch template.
        - `asg.tf`: Contains Terraform configurations to provision an auto scaling group and associated policies.
        - `elb.tf`: Contains Terraform configurations to provision an Application Load Balancer, a target group, and a listener.
        - `startapp.sh`: Shell script used by the EC2 launch template to start the Node.js application.
    - **.github/workflows/:**
        - `cicd.yml`: CI/CD file to handle provisioning of infrastructure (Packer and Terraform) on every push to our preferred branch.


## STEPS

1. make changes to your configurations (app or devops)
2. push to your trigger branch
3. sit back, relax, and enjoy the power of automation


## REMEMBER TO RUN TERRAFORM DESTROY TO CLEAN UP
- in the .github/workflows/cicd.yml file, replace the 'terraform apply' run command to with 'terraform destroy'
