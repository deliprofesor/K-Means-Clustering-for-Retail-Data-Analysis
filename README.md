# K-Means Kümeleme ile Toptan Satış Verisi Analizi

![başlık](https://github.com/user-attachments/assets/1e31646b-c16e-44ed-ac13-5e71fc737e57)

K-Means Kümeleme Algoritması kullanarak toptan satış (wholesale) verilerini analiz eder ve müşterileri harcama alışkanlıklarına göre farklı gruplara ayırır. Proje, müşterilerin belirli ürün kategorilerindeki yıllık harcamalarını kullanarak, onları segmentlere ayırmayı amaçlar. Bu tür bir analiz, perakende işletmeleri için pazarlama stratejileri geliştirmek ve hedef kitleye yönelik teklifler oluşturmak açısından oldukça önemlidir. Bu projede, K-Means algoritması ile toptan satış verisi analiz edilmiştir ve müşteriler, harcama alışkanlıklarına göre 4 kümeye ayrılmıştır. Ayrıca, kümeleme modelinin doğruluğunu belirlemek için Elbow ve Silhouette yöntemleri kullanılarak en uygun küme sayısı belirlenmiştir. Elde edilen sonuçlar, işletmelere stratejik kararlar alırken faydalı olabilecek bilgiler sunmaktadır.

# Kullanılan Yöntemler ve Teknikler
- **K-Means Kümeleme: Müşterilerin harcama alışkanlıklarını benzer özelliklere göre kümeler.**
- **Elbow ve Silhouette Yöntemleri: En uygun küme sayısının belirlenmesine yardımcı olur.**
- **Boxplot ve Scatter Plot: Kümeleme sonuçlarının görsel olarak analiz edilmesine olanak tanır.**

# 1. Veri Yükleme ve İnceleme

İlk adımda, wholesale_customers_data.csv dosyasındaki veriler Pandas kütüphanesi ile yüklenir. Veri, toptan satıcıların farklı ürün kategorilerindeki harcamalarını içerir.
Verinin yapısı incelenir ve genel istatistiksel bilgileri elde edilir. View() fonksiyonu ile verinin ilk birkaç satırı görselleştirilir.

# 2. Veri Ön İşleme
Veriye ölçekleme (scaling) işlemi uygulanır. Bu, farklı ölçeklere sahip değişkenlerin daha anlamlı bir şekilde karşılaştırılabilmesi için gereklidir. preProcess() fonksiyonu ile ortalama ve standart sapma kullanılarak veriler normalize edilir.
Eksik veriler kontrol edilerek varsa eksiklikler giderilir.
Aykırı değerler (outliers) tespit edilip temizlenebilir, ancak bu projede bu aşama daha çok kontrol amacıyla yapılmaktadır.

# 3. Kümeleme Modeli
K-Means Kümeleme Algoritması uygulanır. Bu algoritma, verileri belirli sayıda kümeye ayırır ve her küme, benzer özelliklere sahip verilerden oluşur. Kümeleme modeli oluşturulurken 4 küme sayısı belirlenir.
Model oluşturulurken kullanılan parametreler: centers=4 (4 küme), iter.max=15 (maksimum 15 iterasyon), ve nstart=15 (15 farklı başlangıç noktası ile başlatma).
Kümeleme sonuçları ve her bir verinin ait olduğu küme (clusterModel$cluster) elde edilir.

![k-means clustering](https://github.com/user-attachments/assets/35756eea-a92b-4c18-b839-948a0ffabd22)


# 4. Kümeler Arası Analiz
Kümeleme sonuçlarına göre her bir küme için ortalama harcama değerleri hesaplanır. Her küme için Fresh, Milk, Grocery, Frozen, Detergents_Paper, ve Delicatessen ürün kategorilerindeki harcamalar incelenir.
Kümelemeyi görselleştirmek için boxplot grafikleri kullanılır. Bu grafikler, her kümedeki harcama dağılımlarını gösterir.

![Fresh Harcama - boxplot](https://github.com/user-attachments/assets/4e6d66cc-e69b-4ccd-b51f-65e0c4b592cf)
![Milk Harcama boxplot](https://github.com/user-attachments/assets/40ee9a51-be52-4174-a9b4-a6d30716de84)


# 5. Küme Sayısının Belirlenmesi (Optimal K)
Elbow Yöntemi (WSS - Within-cluster Sum of Squares) ile doğru küme sayısının belirlenmesi sağlanır. WSS değeri, her bir küme için toplam varyansı ölçer ve bu değerin minimum olduğu nokta optimal küme sayısını verir.
Silhouette Yöntemi ile kümeleme sonuçlarının kalitesi değerlendirilir. Silhouette skoru, her bir verinin doğru küme içinde olup olmadığını gösterir.

![Elbow_wss](https://github.com/user-attachments/assets/4c2b8288-7aba-41db-bcc1-abc0df531048)
![elbow](https://github.com/user-attachments/assets/fdcaab99-2883-4e3c-a54d-9102e829ed72)
![silhouette](https://github.com/user-attachments/assets/f5e0fa79-bed3-4538-9e0c-23a0b588d1d1)
![silScore](https://github.com/user-attachments/assets/e638f9e9-ecc7-433f-bc4b-4d65d10ca22e)


# 6. Modelin Geliştirilmesi

Elbow ve Silhouette yöntemleriyle belirlenen en uygun K değeri kullanılarak yeni kümeleme modelleri (2 küme ve 3 küme) oluşturulur.
Bu yeni kümelerle birlikte verinin tekrar analiz edilmesi sağlanır ve her küme için ortalama harcama değerleri yeniden hesaplanır.
![K2](https://github.com/user-attachments/assets/85873e32-4945-4bf0-9ed5-c0c7fe0c3c10)
![K3](https://github.com/user-attachments/assets/5f534c6d-6401-415f-89ee-a8cdc3c9c315)


# 7. Sonuçların Görselleştirilmesi
Kümeleme sonuçları, fviz_cluster() fonksiyonu ile görselleştirilir. Bu fonksiyon, kümelerin görsel temsilini sağlar.
Boxplot ve Silhouette gibi görselleştirmelerle kümeler arasındaki farklar daha anlaşılır hale getirilir.


























