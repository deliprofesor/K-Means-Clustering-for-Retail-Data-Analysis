# K-Means-R
K-Means Algorithm
The K-Means algorithm is an unsupervised learning algorithm used for data clustering. Its primary objective is to partition data points into a pre-defined number of K clusters. During this partitioning, the algorithm minimizes the distance of each data point to a cluster centroid.

The general workflow of the algorithm includes the following steps:

1) Centroid Selection: Initially, K cluster centroids are randomly chosen or selected from the data points.
2) Assignment of Data Points: Each data point is assigned to its closest cluster centroid, determining which clusters the data points belong to.
3) Recomputation of Cluster Centroids: The centroid of each cluster is recomputed by taking the average of data points assigned to that cluster.
4) Reassignment and Recomputation: Data points are reassigned to new cluster centroids, and this process is repeated until cluster centroids no longer change or change according to a specified criterion.
5) Evaluation of Results: The algorithm provides the final positions of cluster centroids and data points, which are used for data clustering analysis.

The K-Means algorithm is commonly used in fields such as data mining, pattern recognition, and data analytics. It serves to divide data sets into distinct groups, understand structures within data sets, and is an important technique used in data analysis.
This code analyzes wholesale customer data using the K-Means clustering algorithm. Here's an explanation of the process:

1) Loading Required Libraries: First, necessary R libraries (cluster, factoextra, caret, ggplot2) are loaded.
2) Reading Data: Data is read from the Wholesale_customers_data.csv file.
3) Data Preprocessing: Data is scaled (centering and scaling) to remove outliers. Centering involves shifting each feature's mean to zero by subtracting the mean from each feature value. Scaling involves bringing feature values to a specific range or scale, often scaling them to a minimum-maximum range or between 0 and 1.
4) Missing Value Check: Missing values in the data are checked using the mice library.
5) Creating Clustering Model: The data is analyzed using a four-center (centers = 4) clustering model with the K-Means algorithm.
6) Examining Clustering Results: Clustering results are visualized (using boxplot and fviz_cluster), exploring which variables contribute to the clusters.
Boxplot: Boxplot is a graphical technique used to visualize the distribution of a dataset. It shows the central tendency (mean, median), spread (minimum, maximum, interquartile range), and outliers of the dataset.
fviz_cluster: fviz_cluster is a function in the factoextra package used to visualize clustering results. It visualizes cluster centers obtained from K-Means or other clustering algorithms and shows which data points belong to which cluster.
7) Determining Optimal K: Optimal cluster number (K) is determined using the Elbow and Silhouette methods.
Elbow Method: It determines the optimal K by calculating the "within-cluster sum of squares" (WCSS) for different K values. WCSS represents the sum of squares of distances of each data point to its cluster center, indicating clustering quality. In the Elbow method, a graph of K values against WCSS values is plotted, and an elbow point is identified where the rate of decrease in WCSS slows down significantly, representing the optimal K.
Silhouette Method: It evaluates clustering quality and determines the optimal K by calculating the Silhouette coefficient for each data point. The Silhouette coefficient measures a data point's similarity within its cluster (a) and dissimilarity from other clusters (b), ranging from -1 to 1. Values closer to 1 indicate a well-clustered data point, while values near -1 indicate misclassification. Optimal K is typically where Silhouette coefficients are highest.
8) Model Building with Optimal K: New clustering models are built using the optimal K values, and the results are examined.
The purpose of this code is to cluster wholesale customer data using the K-Means algorithm and analyze the clustering results.

K-Means algoritması
K-Means algoritması, veri kümeleme için kullanılan bir unsupervised (denetimsiz) öğrenme algoritmasıdır. Temel amacı, veri noktalarını önceden belirlenen sayıda K kümesine (clusters) bölmektir. Bu bölmeyi yaparken her bir veri noktasının bir küme merkezine (centroid) olan uzaklığı minimize edilir. Algoritmanın genel işleyişi şu adımları içerir:

1) Küme Merkezi Seçimi: Başlangıçta, K adet küme merkezi rastgele seçilir veya veri noktalarından rastgele seçilir.
2) Veri Noktalarının Atanması: Her veri noktası, en yakın küme merkezine atanır. Bu adım, veri noktalarının hangi kümelerde olduğunu belirler.
3) Küme Merkezi Yeniden Hesaplama: Her kümenin merkezi, o kümeye atanmış olan veri noktalarının ortalaması alınarak yeniden hesaplanır.
4) Yeniden Atama ve Yeniden Hesaplama: Veri noktaları tekrar yeni küme merkezlerine atanır ve bu işlem, küme merkezlerinin değişmediği veya belirli bir kriterle değişimin azaldığı bir noktaya kadar tekrarlanır.
5) Sonuçların Değerlendirilmesi: Algoritma, küme merkezlerinin ve veri noktalarının son durumunu verir. Bu son durum, veri kümeleme analizinde kullanılır.

K-Means algoritması genellikle veri madenciliği, desen tanıma ve veri analitiği gibi alanlarda kullanılır. Veri setlerini belirli gruplara ayırmak, veri setlerindeki yapıları anlamak, veri analizinde kullanılan önemli bir tekniktir.


Bu kod K-Means kümeleme algoritması kullanarak toptan müşteri verilerini analiz ediyor. İşlemlerin açıklamaları şöyle:

1) Kütüphanelerin Yüklenmesi: İlk olarak, gerekli R kütüphaneleri (cluster, factoextra, caret, ggplot2) yükleniyor.
2) Verinin Okunması: Wholesale_customers_data.csv dosyasından veri okunuyor.
3) Veri Ön İşleme: Veri ölçeklenerek (centering ve scaling) aykırı değerlerden arındırılıyor. Centering: Veri setindeki her bir özelliğin ortalamasını sıfıra kaydırmaktır. Bu, her bir özellik değerinden ortalamayı çıkartarak yapılır. Scaling: Veri setindeki özellik değerlerini belirli bir aralığa veya ölçeğe getirme işlemidir. Bu genellikle özellik değerlerini belirli bir minimum-maksimum aralığına veya 0 ile 1 arasına ölçeklendirme amacı taşır.
4) Eksik Değer Kontrolü: mice kütüphanesi kullanılarak veride eksik değerlerin kontrolü yapılıyor.
5) Kümeleme Modelinin Oluşturulması: K-Means algoritması kullanılarak veri seti dört merkezli (centers = 4) bir kümeleme modeliyle analiz ediliyor.
6) Kümeleme Sonuçlarının İncelenmesi: Elde edilen kümeleme sonuçları görselleştirilerek (boxplot ve fviz_cluster), kümelemelerin hangi değişkenler üzerinden gerçekleştiği inceleniyor.  Boxplot: Boxplot, veri setinin dağılımını görselleştirmek için kullanılan bir grafik tekniğidir. Boxplot, veri setinin merkezi eğilimini (ortalama, medyan), veri setinin yayılımını (minimum, maksimum, çeyrekler arası aralık) ve aykırı değerleri görsel olarak sunar. fviz_cluster: fviz_cluster, factoextra paketinde yer alan bir fonksiyondur ve kümeleme sonuçlarını görselleştirmek için kullanılır. Bu fonksiyon, K-Means veya diğer kümeleme algoritmaları sonucunda elde edilen küme merkezlerini ve veri noktalarının hangi kümeye ait olduğunu görsel olarak sunar.
7) Optimal K Belirlenmesi: Elbow ve Silhouette yöntemleri kullanılarak optimal küme sayısı (K) belirleniyor.
Elbow Yöntemi: Elbow yöntemi, veri kümeleme analizinde optimal küme sayısını belirlemek için kullanılan sezgisel bir yöntemdir. Bu yöntemde, farklı K değerleri için K-Means algoritması çalıştırılır ve her bir K değeri için kümeleme sonucunun "within-cluster sum of squares" (WCSS) değeri hesaplanır. WCSS, her bir veri noktasının kendi küme merkezine olan mesafesinin karesi toplamını ifade eder ve kümeleme sonuçlarının ne kadar iyi olduğunu gösterir. Elbow yönteminde, K değerleri için WCSS değerleri grafiğe çizilir. Grafikte, K değerlerine karşı WCSS değerleri arasında bir dirsek oluşur. Dirseğin olduğu nokta, küme sayısının artık önemli bir iyileşme sağlamadığı ve optimal K değerini temsil ettiği düşünülür.
Silhouette Yöntemi: Silhouette yöntemi, kümeleme sonuçlarının kalitesini değerlendirmek ve optimal küme sayısını belirlemek için kullanılan bir başka yöntemdir. Bu yöntemde, her veri noktası için Silhouette katsayısı hesaplanır. Silhouette katsayısı, bir veri noktasının kendi kümeleme içindeki benzerliğini (a) kendi kümesinden diğer kümelere olan farklılığını (b) dikkate alarak hesaplar. Silhouette katsayısı -1 ile 1 arasında değer alır; 1'e yaklaşan değerler, veri noktasının doğru kümede olduğunu, -1'e yaklaşan değerler ise yanlış kümede olduğunu gösterir. Optimal küme sayısını belirlemek için Silhouette katsayıları, farklı K değerleri için hesaplanır ve bu değerler grafiksel olarak değerlendirilir. Optimal K değeri, Silhouette katsayılarının genellikle en yüksek olduğu noktadır.
8) Optimal K ile Model Oluşturma: Elde edilen optimal K değerleriyle yeni kümeleme modelleri oluşturuluyor ve sonuçlar inceleniyor.

Bu kodun amacı, toptan müşteri verilerini kümelemek ve bu kümeleme sonuçlarını analiz etmek için K-Means algoritmasını kullanmaktır.
























