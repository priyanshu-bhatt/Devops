## ATHENA
- Service More related to Anlytics and analysis purposes.
- Log files mostly have data which is raw that is unsorted kind of and this data is called bigdata,
The big storage that store all the big data is called Data Lake and this Data lake is used to do analysis on the logs.
{DATA-LAKE} use case to store big data and in future we have to do analysis in the that data.
We can use 3rd party tools to analyze the data lake but its require a lot of data transfer.
Hence This DataLake is created in AWS using S3.As most imp stuff for datalake is scalable and IO opration faster hence s3 is usefull for it.
The tool which analyze the data without moving the data(making it faster) in s3 itself is an AWS service is ATHENA.

## ATHENA IS A TOOL FOR ANALYTICS SERVICE HIGLY INTEGRATED WITH S3.
- For athena one of the data source is S3.
- With raw date we require metadata to anaylse the stuffs that which heading it feels in.,Hence before using ATHENA we create metadata/column name/shchema to analyze it with ATHENA this is done by using other service 
called |GLUE|.

ATHENA can be compared as HIVE, S3 as hadoop HDFS,Glue Data Catalog as Hive Metastore.
ATHENA is a serverless service.

S3 bydefault latency is around 5000/6000 files in as second roughly.But if the traffic is huge then it will slow down but we cant go above 5000/660 per second as its the highest.Hence We 
can arrange data in s3 better way i.e. subflder in bucket and diff data falls in diff folder this can be done using prefix in s3(no limit of prefix) more rprefix more parallel operations and ince
the speed that s3 provide.



 