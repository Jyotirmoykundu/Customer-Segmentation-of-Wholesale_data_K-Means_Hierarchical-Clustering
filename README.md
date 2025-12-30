### Analysis and Comparison of K-Means and Hierarchical Clustering for Wholesale Customer Segmentation
### Objective
The goal of this project is to segment wholesale customers based on purchasing patterns across six product categories: Fresh, Milk, Grocery, Frozen, Detergents_Paper, and Delicassen.
We apply unsupervised learning techniques (K-means and hierarchical clustering) and visualize structure using Principal Component Analysis (PCA).
Cluster similarity is quantified using the Adjusted Rand Index (ARI).
### Dataset
 Wholesale Customers Data (CSV)
### Features used: Fresh, Milk, Grocery, Frozen, Detergents_Paper, Delicassen
### K-Means Clustering
Optimal number of clusters determined by Elbow Method: k = 5.   no of customers[ 63  269  10  97  1]
### Hierarchical Clustering (Ward’s Method)
Dendrogram cut at k = 5 for comparison. no of customers[ 153  177  104  5   1]
### PCA Visualization

PCA performed on scaled data and the first two PC's were plotted with colors from k mean clustering. Major clusters are seemed to merge on the right which confirms meaningful structure .
Although PCA was computed once, it can be used to visualize both K-means and hierarchical clusters by coloring points according to cluster assignments.
### Cluster Comparison
Cross-tabulation shows partial alignment between K-means and hierarchical clusters.Adjusted Rand Index (ARI) = 0.409, indicating moderate agreement between the two clustering methods.
