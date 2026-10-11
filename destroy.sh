#!/bin/bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-my-first-cloudformation-stack}"
REGION="${REGION:-us-east-1}"

if ! command -v aws >/dev/null 2>&1; then
  echo "ERROR: AWS CLI is not installed or not on PATH." >&2
  exit 1
fi

aws cloudformation delete-stack --stack-name "$STACK_NAME" --region "$REGION"
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME" --region "$REGION"

echo "Stack $STACK_NAME has been deleted successfully from region $REGION."
