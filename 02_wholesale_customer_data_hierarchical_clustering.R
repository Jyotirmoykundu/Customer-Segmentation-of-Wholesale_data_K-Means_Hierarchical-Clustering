
# hclust --------------------------------------------------
dist_matrix <- dist(customer_scaled, method = "euclidean")
hclust_result <- hclust(dist_matrix, method = "ward.D2")
plot(hclust_result,
     labels = FALSE,
     hang = -1,
     main = "Hierarchical Clustering Dendrogram")
hclust_cluster <- cutree(hclust_result, k = 5)
data$HClust_Cluster <- factor(hclust_cluster)
table(data$HClust_Cluster)
aggregate(customer_data,
          by = list(Cluster = data$HClust_Cluster),
          mean)

#comparison-------------------------------------------------

table(data$KMeans_Cluster)
table(data$HClust_Cluster)
library(mclust)
# Compute Adjusted Rand Index
ari <- adjustedRandIndex(data$KMeans_Cluster, data$HClust_Cluster)
ari

