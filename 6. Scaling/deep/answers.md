# From the Deep

## Random Partitioning

Random partitioning evenly distributes observations across all boats, ensuring load balancing and optimal storage usage. However, querying data for specific time ranges is inefficient, as the query must be executed on all boats to retrieve the desired observations.

## Partitioning by Hour

Partitioning by hour allows efficient time-based queries, since only certain boats will contain data for specific time ranges. The downside is uneven data distribution if most observations occur during certain hours, leading to storage and processing bottlenecks on specific boats.

## Partitioning by Hash Value

Partitioning by hash value ensures even distribution of data across all boats, regardless of the time when observations were made. However, querying time ranges is inefficient because the hash function doesn't preserve any temporal order, requiring queries to be run on all boats.
