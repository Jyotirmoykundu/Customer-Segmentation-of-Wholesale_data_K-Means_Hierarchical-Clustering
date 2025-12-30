#k means--------------------------------------------
library(cluster)
data<-read.csv("Wholesale customers data.csv")
View(data)
str(data)
customer_data <- data[, c("Fresh","Milk","Grocery","Frozen","Detergents_Paper","Delicassen")]

View(customer_data)
customer_scaled <- scale(customer_data)
wss <- numeric(10)
for (k in 1:10) {
  set.seed(123)
  wss[k] <- kmeans(customer_scaled,centers = k,nstart = 25)$tot.withinss
}
plot(1:10, wss,
     type = "b",
     pch = 19,
     xlab = "Number of Clusters (k)",
     ylab = "Within-Cluster Sum of Squares",
     main = "Elbow Method")
# Apply K-means (k = 5)
set.seed(123)
kmeans_result <- kmeans(customer_scaled,centers = 5, nstart = 25)
data$KMeans_Cluster <- factor(kmeans_result$cluster)
# Cluster sizes
kmeans_result$size
aggregate(customer_data,by = list(data$KMeans_Cluster),mean)

#PCA FOR VISUALIZATION ------------------------------------------------
pca_result <- prcomp(customer_scaled, center = FALSE, scale = FALSE)
summary(pca_result)
pca_data <- data.frame(
  PC1 = pca_result$x[,1],
  PC2 = pca_result$x[,2],
  Cluster = data$KMeans_Cluster
)
plot(pca_data$PC1, pca_data$PC2,
     col = pca_data$Cluster,
     pch = 19,
     xlab = "Principal Component 1",
     ylab = "Principal Component 2",
     main = "PCA Visualization of K-means Clusters")

legend("bottomright",
       legend = levels(pca_data$Cluster),
       col = 1:length(levels(pca_data$Cluster)),
       pch = 19,
       title = "Cluster")
