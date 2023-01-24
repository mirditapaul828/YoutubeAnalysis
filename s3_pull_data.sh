# To copy all JSON Reference data to same S3 bucket:
aws s3 cp YoutubeData/. s3://youtube-raw-data-project/youtube/raw_statistics_reference_data/ --recursive --exclude "*" --include "*.json"

# To copy all data files to its own location:
aws s3 cp YoutubeData/CAvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=ca/
aws s3 cp YoutubeData/DEvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=de/
aws s3 cp YoutubeData/FRvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=fr/
aws s3 cp YoutubeData/GBvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=gb/
aws s3 cp YoutubeData/INvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=in/
aws s3 cp YoutubeData/JPvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=jp/
aws s3 cp YoutubeData/KRvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=kr/
aws s3 cp YoutubeData/MXvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=mx/
aws s3 cp YoutubeData/RUvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=ru/
aws s3 cp YoutubeData/USvideos.csv s3://youtube-raw-data-project/youtube/raw_statistics/region=us/
