# Gerekli kütüphaneleri yükleyelim
library(cluster)
library(factoextra)
library(caret)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(mice)

# Veriyi CSV dosyasından okuyalım
wholesale <- read.csv("C:\\Users\\LENOVO\\Downloads\\K-Means-R-main\\K-Means-R-main\\Wholesale_customers_data.csv")
# wholesale <- read.csv("wholesale_customers_data.csv")
View(wholesale)

# Veri ön işleme: Ölçeklendirme (Center & Scale)
scaleModel <- preProcess(wholesale, method = c("center", "scale"))
modelData <- predict(scaleModel, wholesale)

# Eksik verilerin kontrolü
md.pattern(modelData)

# Kümeleme modelini oluşturma (K-Means, 4 küme)
clusterModel <- kmeans(modelData, centers = 4, iter.max = 15, nstart = 15)
clusterModel

# Kümeleme sonuçları
fittedCluster <- fitted(clusterModel)
View(fittedCluster)

# Kümeleme sonuçları ile tersine ölçeklenmiş veriyi görselleştirelim
# Reverse scaling for interpretation
reversedData <- modelData %>%
  select(one_of(scaleModel$mean %>% names)) %>%
  map2_df(scaleModel$std, function(sd, var) {var * sd}) %>%
  map2_df(scaleModel$mean, function(mu, var) {var + mu})

# Küme bilgilerini veriye ekleyelim
reversedData$cluster <- clusterModel$cluster

# Kümeleme sonuçlarını gruplandırarak özetleyelim
reversedData %>%
  group_by(cluster) %>%
  summarise_all(mean)

# Küme başına boxplot görselleştirmeleri
boxplot(Fresh ~ cluster, data = reversedData, main = "Fresh Harcama Dağılımı", col = c("lightblue"))
boxplot(Milk ~ cluster, data = reversedData, main = "Milk Harcama Dağılımı", col = c("lightgreen"))
fviz_cluster(clusterModel, data = modelData, main = "K-Means Kümeleme Sonuçları")

# Küme içi varyans ve toplam varyans bilgileri
cat("Küme içi varyans (within-cluster variance):", clusterModel$withinss, "\n")
cat("Toplam küme içi varyans (total within-cluster variance):", clusterModel$tot.withinss, "\n")

# Optimal küme sayısını belirlemek için Elbow Yöntemi
wss <- sapply(2:10, FUN = function(x) {
  kmeans(modelData, centers = x, nstart = 10, iter.max = 15)$tot.withinss
})
plot(2:10, wss, type = "b", main = "Elbow Yöntemi", xlab = "Küme Sayısı", ylab = "Toplam İç Varyans (WSS)")

# Silhouette Yöntemi ile Optimal K Değeri
silhouetteScore <- function(x) {
  model <- kmeans(modelData, centers = x, nstart = 10, iter.max = 15)
  sil <- silhouette(model$cluster, dist(modelData))[, 3]
  return(mean(sil))
}

silScores <- sapply(2:10, FUN = silhouetteScore)
plot(2:10, silScores, type = "b", main = "Silhouette Yöntemi", xlab = "Küme Sayısı", ylab = "Silhouette Skoru")

# Optimal K'yi görselleştirelim
fviz_nbclust(modelData, kmeans, method = "wss", main = "Elbow Yöntemi ile Optimal K")
fviz_nbclust(modelData, kmeans, method = "silhouette", main = "Silhouette Yöntemi ile Optimal K")

# Farklı küme sayıları ile modelleme (K=2, K=3)
clusterModelK2 <- kmeans(modelData, centers = 2, nstart = 50, iter.max = 20)
clusterModelK3 <- kmeans(modelData, centers = 3, nstart = 50, iter.max = 20)

# K=2 ve K=3 kümeleri görselleştirelim
fviz_cluster(clusterModelK2, data = modelData, main = "K=2 Kümeleme Sonuçları")
fviz_cluster(clusterModelK3, data = modelData, main = "K=3 Kümeleme Sonuçları")

# Kümeleme sonuçlarını ters ölçeklendirilmiş veriye ekleyelim
reversedData$clusterK2 <- clusterModelK2$cluster
reversedData$clusterK3 <- clusterModelK3$cluster

# Kümelerin ortalamalarını hesaplayalım
reversedData %>%
  group_by(clusterK2) %>%
  summarise_all(mean)

reversedData %>%
  group_by(clusterK3) %>%
  summarise_all(mean)

# Sonuçları özetleyelim
cat("Küme başına Fresh Harcama Ortalamaları:\n")
summary(reversedData$Fresh)
cat("Küme başına Milk Harcama Ortalamaları:\n")
summary(reversedData$Milk)

