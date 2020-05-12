# Create Shared Image Gallery and generate Images using Packer

## Required Software
    - Azure Subscription
    - Azuer CLI
    - Packer
    - Terraform

## Create Service Principle
    az ad sp create-for-rbac --name sharedimage-sp 

## Apply the values from the Service Principle to the files
    Values:
        subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        client_secret   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    
    Files:
        jumpbox.json
        mediacentral.json
        mediacomposer.json
        mediacomposer2020.json
        mediaworker.json
        nexis_cloud_online.json
        nexis_nearline.json
        infrastructure/main.tf
        deployment/main.tf

## Steps
    - Create Azure Infrastructure
        - execute in infrastructure dir
        tertaform init
        terraform validate
        terraform apply -auto-approve
    - Build and deploy Images
        packer build nexis.json
        packer build jumpbox.json
        packer build mediacomposer.json
        packer build mediacentral.json
    - Access Shared Image Gallery
        - execute in infrastructure dir
        tertaform init
        terraform validate
        terraform apply -auto-approve
