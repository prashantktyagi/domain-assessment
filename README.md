Cloud Domain Assessment
---

- [Prerequisites] (#prerequisites)
    - [IaC] (#IaC)
    - [ansible] (#ansible)
    - [aws-credentials] (#aws-credentials)
- How to run (#how-to-run)
    - [provisioning] (#provisioning)
    - [deployment] (#deployment)
- Logging (#logging)


# pre-requisites

## IaC

Install terraform on local - 

https://learn.hashicorp.com/tutorials/terraform/install-cli

Install aws cli to configure login

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## ansible

Install ansible on local machine

```bash
sudo pip install ansible
```

install boto3

```bash
sudo pip install boto3
```

## aws-credentials

Set aws credentails

```bash
touch ~/.aws/credentails
[profile <profile-name>]
aws_access_key_id = <your_access_key_here>
aws_secret_access_key = <your_secret_key_here>

touch ~/.aws/config
[profile <profile-name>]
region = us-east-1
output = json
```

# how-to-run

## provisioning

Provision aws ec2 machine (update ami, vpc, subnet, kaypair for your aws account in local.tf)

```bash
AWS_PROFILE=<profile-name> terraform init
AWS_PROFILE=<profile-name> terraform plan
AWS_PROFILE=<profile-name> terraform apply
```

## deployment

```bash
AWS_PROFILE=<profile-name> ansible -i <inventory-path> install-nginx.yml
AWS_PROFILE=<profile-name> ansible -i <inventory-path> deploy-static.yml
```

#logging

```bash
AWS_PROFILE=<profile-name> ansible -i <inventory-path> deploy-cwa.yml
```




