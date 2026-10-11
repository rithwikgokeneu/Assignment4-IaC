#!/bin/bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-my-first-cloudformation-stack}"
REGION="${REGION:-us-east-1}"
TEMPLATE_FILE="src/lab2Stack.yaml"
KEY_PAIR_NAME="${KEY_PAIR_NAME:-}"

if ! command -v aws >/dev/null 2>&1; then
  echo "ERROR: AWS CLI is not installed or not on PATH." >&2
  exit 1
fi

if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "ERROR: CloudFormation template not found: $TEMPLATE_FILE" >&2
  exit 1
fi

CMD=(aws cloudformation create-stack --stack-name "$STACK_NAME" --template-body "file://$TEMPLATE_FILE" --region "$REGION")

if [ -n "$KEY_PAIR_NAME" ]; then
  CMD+=(--parameters "ParameterKey=KeyPairName,ParameterValue=$KEY_PAIR_NAME")
fi

"${CMD[@]}"

aws cloudformation wait stack-create-complete --stack-name "$STACK_NAME" --region "$REGION"

echo "Stack $STACK_NAME has been created successfully in region $REGION."
