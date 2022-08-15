# Terraform Configuration files
This repo contains terraform configuration files for creation of
all neccessary components for the infrastructure represented on the picture
below.

## Architecture of system
Graphical representation of the system

![alt text](https://github.com/stevan95/terraform-script/blob/main/infrastructure.PNG)

## How to setup layer for lambda function

As a prerequisite you have to install node.js on your local system.

Create folder structure like /layer/aws/nodejs and runs following commands:

```sh
mkdir -p /layer/aws/nodejs
cd /layer/aws/nodejs
npm init -y
npm install aws-sdk
```

## Open issue

List of currently open issue

| Issue | Description | STATUS |
| ------ | ------ | ------ |
| PipelineID | After creation of infrastructure you have to specify pipeline Id manulay for ElasticTranscoder. Value of pipelineID is provided in output variable. | IN PROGRESS |
| Trigger | Implement trigger creation for lambda function using terraform. This process is also manual. | DONE |