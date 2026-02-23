from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("YieldAnalysis").getOrCreate()

df = spark.read.csv("data/processed/cleaned_data.csv", header=True, inferSchema=True)

df.show(5)

df.groupBy("Area").avg("Yield").show()

df.groupBy("Item").avg("Yield").show()
