#!/bin/bash

# Set the names of the Crawlers, databases and the s3 path
CRAWLER1_NAME="raw-category-data-crawler"
CRAWLER2_NAME="raw-video-data-crawler"
CRAWLER3_NAME="cleansed-category-data-crawler"
CRAWLER4_NAME="cleansed-video-data-crawler"
DATABASE1_NAME="video-data"
DATABASE2_NAME="category-data"
S3_PATH_1="s3://youtube-project-1/source_data/raw_statistics"
S3_PATH_2="s3://youtube-project-1/source_data/raw_statistics_reference_data"
S3_PATH_3="s3://youtube-project-1/output/category_data"
S3_PATH_4="s3://youtube-project-1/output/video_data"

# Create the first two Glue Crawlers
aws glue create-crawler \
    --name $CRAWLER2_NAME \
    --database-name $DATABASE1_NAME \
    --role arn:aws:iam::<YOUR_ACCOUNT_ID>:role/<YOUR_GLUE_ROLE> \
    --targets S3 \
    --s3-target $S3_PATH_1

aws glue create-crawler \
    --name $CRAWLER4_NAME \
    --database-name $DATABASE1_NAME \
    --role arn:aws:iam::<YOUR_ACCOUNT_ID>:role/<YOUR_GLUE_ROLE> \
    --targets S3 \
    --s3-target $S3_PATH_4

# Create the last two Glue Crawlers
aws glue create-crawler \
    --name $CRAWLER3_NAME \
    --database-name $DATABASE2_NAME \
    --role arn:aws:iam::<YOUR_ACCOUNT_ID>:role/<YOUR_GLUE_ROLE> \
    --targets S3 \
    --s3-target $S3_PATH_3

aws glue create-crawler \
    --name $CRAWLER1_NAME \
    --database-name $DATABASE2_NAME \
    --role arn:aws:iam::<YOUR_ACCOUNT_ID>:role/<YOUR_GLUE_ROLE> \
    --targets S3 \
    --s3-target $S3_PATH_2

