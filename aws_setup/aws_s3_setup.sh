#!/bin/bash

# Set the name of the S3 bucket
BUCKET_NAME="youtube-project-1"

# Create the S3 bucket
aws s3 mb s3://$BUCKET_NAME

# Create the four different folders inside the S3 bucket
aws s3 mb s3://$BUCKET_NAME/source_data
aws s3 mb s3://$BUCKET_NAME/output
aws s3 mb s3://$BUCKET_NAME/athena
aws s3 mb s3://$BUCKET_NAME/analytics

aws s3 mb s3://$BUCKET_NAME/source_data/raw_statistics
aws s3 mb s3://$BUCKET_NAME/source_data/raw_statistics_reference_data
aws s3 mb s3://$BUCKET_NAME/output/category_data
aws s3 mb s3://$BUCKET_NAME/output/video_data

