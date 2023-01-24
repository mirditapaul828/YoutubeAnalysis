#!/bin/bash

# Set the name of the Lambda function and the S3 bucket
FUNCTION_NAME="youtube-lambda-json-to-parquet"
BUCKET_NAME="youtube-project-1"
FOLDER_NAME="source_data/raw_statistics_reference_data/"

# Create the Lambda function
aws lambda create-function \
    --function-name $FUNCTION_NAME \
    --runtime python3.8 \
    --handler index.handler \
    --role arn:aws:iam::<YOUR_ACCOUNT_ID>:role/lambda_s3_exec_role \
    --zip-file fileb://<path/to/function.zip>

# Create the S3 event trigger
aws lambda create-event-source-mapping \
    --function-name $FUNCTION_NAME \
    --event-source arn:aws:s3:::$BUCKET_NAME \
    --batch-size 1
    --events s3:ObjectCreated:* \
    --filter '{"Key": {"Prefix": "'"$FOLDER_NAME"'/"}}'

