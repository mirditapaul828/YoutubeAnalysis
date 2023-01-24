import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args["JOB_NAME"], args)

# Script generated for node Category Data
CategoryData_node1673891364641 = glueContext.create_dynamic_frame.from_catalog(
    database="category-data",
    table_name="cleansed-category-table_category_data",
    transformation_ctx="CategoryData_node1673891364641",
)

# Script generated for node Video Data
VideoData_node1673891400038 = glueContext.create_dynamic_frame.from_catalog(
    database="video-data",
    table_name="csv-to-parquet_raw_statisticsvideo_data",
    transformation_ctx="VideoData_node1673891400038",
)

# Script generated for node Join
Join_node1673891448688 = Join.apply(
    frame1=VideoData_node1673891400038,
    frame2=CategoryData_node1673891364641,
    keys1=["category_id"],
    keys2=["id"],
    transformation_ctx="Join_node1673891448688",
)

# Script generated for node Output Bucket
OutputBucket_node1673891710458 = glueContext.getSink(
    path="s3://youtube-project-1/analytics/",
    connection_type="s3",
    updateBehavior="UPDATE_IN_DATABASE",
    partitionKeys=[],
    compression="snappy",
    enableUpdateCatalog=True,
    transformation_ctx="OutputBucket_node1673891710458",
)
OutputBucket_node1673891710458.setCatalogInfo(
    catalogDatabase="youtube_analytics", catalogTableName="final_analytics"
)
OutputBucket_node1673891710458.setFormat("glueparquet")
OutputBucket_node1673891710458.writeFrame(Join_node1673891448688)
job.commit()
