Proje Başlığı:  Hukuk-Veritabanı

Proje Ekibindeki Kişiler:

Devran Ali Özay (225260035) , 
Tunahan Öztürk  (225260009)

Proje Özeti:

Bu proje, avukatların müvekkil ve dava dosyalarını dijital ortamda güvenli bir şekilde yönetmelerini sağlamak amacıyla geliştirilmiş bir hukuk yönetim sistemi uygulamasıdır. Uygulama, her avukatın yalnızca kendi müvekkil ve dava dosyalarına erişim yetkisine sahip olduğu, güvenlik öncelikli bir yapı sunar. Avukatlar, e-posta ve şifre bilgileriyle sisteme giriş yaparak:

Müvekkil Yönetimi: Yeni müvekkil ekleyebilir, mevcut müvekkillerinin bilgilerini görüntüleyebilir.
Dava ve Dosya Yönetimi: Müvekkillerine ait davaları listeleyebilir, her dava için dosya ve belge ekleyebilir, saklayabilir.
Dava Durumu Güncellemeleri: Dava durumunu güncelleyebilir ve davalarla ilgili önemli notları güvenli bir şekilde saklayabilir.
Proje kapsamında, veritabanı Java ile bağlantılı olarak oluşturulmuş ve Java'da bir grafik kullanıcı arayüzü (GUI) ile yönetim ekranları geliştirilmiştir. Kullanıcı dostu arayüz sayesinde, avukatlar kolaylıkla sisteme giriş yapabilir ve işlemlerini gerçekleştirebilirler. Uygulamanın mevcut sürümü, geliştirme aşamasında olup ilerleyen dönemlerde bir tam işlevsel uygulama (application) haline getirilmesi planlanmaktadır. Bu yapının tamamlanmasıyla, avukatlar için kapsamlı bir hukuk yönetim sistemi sunulacaktır.

![image](https://github.com/user-attachments/assets/7914c1e3-6f3d-4c64-b76a-a7a8529169cf)



Relations:

Avukat - Müvekkil: Her avukat birden fazla müvekkile sahip olabilir, her müvekkilin de birden fazla avukatı olabilir. 
(M-N)

Müvekkil - Dosya: Her müvekkilin birden fazla dosyası olabilir, her dosya bir müvekkile aittir. 
(1-N)

Dosya - Belge: Her dosya birden fazla belgeye sahip olabilir, her belge bir dosyaya aittir. 
(1-N)
