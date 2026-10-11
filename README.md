# Lab 4: Using AWS CloudFormation

## Purpose

This lab introduces students to AWS CloudFormation by deploying a simple stack from `src/lab2Stack.yaml`. The template is designed to help students understand how CloudFormation resources, parameters, and outputs work in practice.

## Current Behavior

This repository currently deploys only the S3 bucket resources because EC2 resources are intentionally commented out in the template. This is a deliberate workaround for AWS Academy restrictions that may prevent EC2 creation in the current environment.

## What the Template Creates

- Two S3 buckets
- A security group definition for EC2 access
- Optional EC2-related resources that are currently disabled

## Prerequisites

- AWS CLI installed and configured
- Access to an AWS account or AWS Academy lab environment
- A valid AWS region configured for deployment

## Deployment

Run the deployment script:

```bash
./deploy.sh
```

You may optionally set a key pair name before running the script:

```bash
KEY_PAIR_NAME=vockey ./deploy.sh
```

## Cleanup

To delete the CloudFormation stack:

```bash
./destroy.sh
```

## Notes

- The template parameter `KeyPairName` is kept for compatibility with EC2-based extensions of the lab.
- The current setup is intentionally conservative and does not require students to modify system networking or create EC2 instances.
- If your environment supports EC2 creation, you can re-enable the commented EC2 resources in `src/lab2Stack.yaml` and update the deployment logic accordingly.
