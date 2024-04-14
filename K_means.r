
### K-Means Algoritması 

# Load required libraries
library(cluster)
library(factoextra)
library(caret)
library(ggplot2)


# Read data from CSV file
wholesale <- read.csv("/home/yorgun/r_tube/Rcode/knn/Wholesale_customers_data.csv")
#wholesale <- read.csv("wholesale_customers_data.csv")
View(wholesale)

# Preprocess data for outliers
scaleModel <- preProcess(wholesale, method = c("center", "scale"))
modelData <- predict(scaleModel, wholesale)
View(modelData)

# Check for missing values
library(mice)
md.pattern(modelData)

# Create clustering model
clusterModel <- kmeans(modelData, centers = 4, iter.max = 15, nstart = 15)
clusterModel

fittedCluster <- fitted(clusterModel)
View(fittedCluster)

# Explore clusters
library(tidyverse)

#%>% pipeline 
reversedData <- modelData %>%
  select(one_of(scaleModel$mean %>% names)) %>%
  map2_df(scaleModel$std, function(sd, var) {var * sd}) %>%
  map2_df(scaleModel$mean, function(mu, var) {var + mu})
View(reversedData)

reversedData$cluster <- clusterModel$cluster
reversedData %>% group_by(cluster) %>% summarise_all(mean)

#FRESH: Annual spending on fresh products
#MILK: Annual spending on milk products
#GROCERY: Annual spending on grocery products
#FROZEN: Annual spending on frozen products
#DETERGENTS_PAPER: Annual spending on detergents and paper products
#DELICATESSEN: Annual spending on delicatessen products
#CHANNEL: Type of channel where the customer operates, either Hotel/Restaurant/Cafe or Retail (Nominal)
#REGION: Customer region, which can be Lisbon, Oporto, or Other (Nominal),

# Visualize clusters
boxplot(Fresh ~ cluster, data = reversedData)
boxplot(Milk ~ cluster, data = reversedData)
fviz_cluster(clusterModel, data = modelData)
clusterModel$withinss
clusterModel$tot.withinss


# Determine optimal K (number of clusters)
wss <- sapply(2:10, FUN = function(x) {
  kmeans(modelData, centers = x, nstart = 10, iter.max = 15)$tot.withinss
})
plot(2:10, wss, type = "b")

# Optimal K using Elbow method
fviz_nbclust(modelData, kmeans, method = "wss")

# Optimal K using Silhouette method
silhouette(clusterModel$cluster , dist(modelData))
silScore <- function(x) {
  model <- kmeans(modelData, centers = x, nstart = 10, iter.max = 15)
  sil <- silhouette(model$cluster, dist(modelData))[, 3]
  score <- mean(sil)
  return(score)
}
scores <- sapply(2:10, FUN = silScore)
plot(2:10, scores, type = "b")
fviz_nbclust(modelData, kmeans, method = "silhouette")

# Create clustering models with optimal K

clusterModelK2 <- kmeans(modelData, centers = 2, nstart = 50, iter.max = 20)
clusterModelK3 <- kmeans(modelData, centers = 3, nstart = 50, iter.max = 20)

fviz_cluster(clusterModelK2, modelData)
fviz_cluster(clusterModelK3, modelData)

reversedData$clusterK2 <- clusterModelK2$cluster
reversedData$clusterK3 <- clusterModelK3$cluster

reversedData %>% group_by(clusterK2) %>% summarise_all(mean)
reversedData %>% group_by(clusterK3) %>% summarise_all(mean)
