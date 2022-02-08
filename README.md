# Carrier-Suppressed_Double_Sideband_Amplitude_Modulation-Demodulation

### 𝑚(𝑡) = 10𝐶𝑜𝑠(50𝜋𝑡) + 20𝐶𝑜𝑠(100𝜋𝑡) mesaj işareti 𝑐(𝑡) = 100𝐶𝑜𝑠(500𝜋𝑡) taşıyıcı işaretini taşıyıcısı bastırılmış (TB)-ÇYB-GM'ye göre modüle etmektedir.

### 1) Mesaj işaretini bir periyod aralığında çizdiriniz. Mesaj işaretinin spektrumunu çizdiriniz.

![image](https://user-images.githubusercontent.com/70964563/152976851-535bb624-f181-47bf-8814-54a2f5d18aa4.png)

Yukarıdaki kod sayesinde hem tek periyot hem de çift periyotta mesaj işareti çıktımızı gözlemleyebiliriz. Harici olarak ekran çıktılarını alırken ismimi ve renk farklılıklarını ve her iki işaretlerini insert ettim. Bu sayede rahatça analiz edebiliriz. (T = 1/f => T= 1/25 = 0.04)

![image](https://user-images.githubusercontent.com/70964563/152976934-6b941701-b242-47d9-a05f-2b308c70ac00.png)

![image](https://user-images.githubusercontent.com/70964563/152976958-f1860dac-ec58-4090-b734-f859d6bf2319.png)

Yukarıdaki kodumuz sayesinde m(t) sinyalimizi zaman domaininden frekans domainine geçirmeyi başardık. Bunu elde edebilmek için Fast Fourier Transform kullanılmıştır. Mutlak değer alarak complex olarak elde edilen çıktıların artık boylarını (karelerinin karekökü) elde edebiliyoruz. Eğer öteleme (fftshift) işlemi sayesinde elde edilen ayrık zamanlı sinyalin sıfır bileşenini spektrumun merkezine kaydırmaktayız. Bu sayede sinyalimiz istediğimiz genlikte ve istediğimiz frekans değerinde aşağıdaki şekildeki gibi görülebilmektedir.

![image](https://user-images.githubusercontent.com/70964563/152977013-6db3822c-2dfc-4e3f-bdce-dda556b9c453.png)

Not: Sağdaki şekilde bir dirac (ծ) elde edildiği gösterilip soldaki figürde ise genlik ve frekans değerleri gösterilmiştir. İnsert işlemleri figüre elde edildikten sonra gerçekleştirilmiştir.

### 2) Modüle edilmiş işaret 𝑦(𝑡)'yi çizdiriniz. Modüle edilmiş işaretin spektrumunu çizdiriniz.

![image](https://user-images.githubusercontent.com/70964563/152977129-d9a7cb9f-3963-4891-89f6-f06c3f790a31.png)

Yukarıdaki genel formu şuan ki problemimiz için uyarlarsak aşağıdaki şekil elde edilir.

![image](https://user-images.githubusercontent.com/70964563/152977161-6f98feb3-de36-4032-8a0c-80e4a88bfa93.png)


Biliyoruz ki y(t) = m(t)*c(t) bu durumda her bir sinyal için denklem yazmak yerine tek satırda yine çıkış işaretimizi çizdirebiliriz.
y(t)= ( 10𝐶𝑜𝑠(50𝜋𝑡) + 20𝐶𝑜𝑠(100𝜋𝑡) ) *( (100𝐶𝑜𝑠(500𝜋𝑡) ) için

![image](https://user-images.githubusercontent.com/70964563/152977223-b881565e-44ba-4cad-99e8-dc0a8c046dde.png)


![image](https://user-images.githubusercontent.com/70964563/152977274-e9c5a012-240f-4964-80c7-729c957fc387.png)


![image](https://user-images.githubusercontent.com/70964563/152977298-f4eb951c-a95f-4fde-ab1b-5bfe3f4db828.png)


Yukarıdaki kodumuz sayesinde y(t) sinyalimizi zaman domaininden frekans domainine geçirmeyi başardık. Burada yapılan asıl işlem kullanılan iki sinyalin(m(t) ve c(t)) bir değişkene atandı ve daha sonra elementwise çarpımı için “ .* ” işlemi kullanıldı. Y(f) elde edebilmek için Fast Fourier Transform kullanılmıştır. Mutlak değer alarak complex olarak elde edilen çıktıların artık boylarını (karelerinin karekökü) elde edebiliyoruz. Eğer öteleme (fftshift) işlemi sayesinde elde edilen ayrık zamanlı sinyalin sıfır bileşenini spektrumun merkezine kaydırmaktayız. Bu sayede sinyalimiz istediğimiz genlikte ve istediğimiz frekans değerinde aşağıdaki şekildeki gibi görülebilmektedir.


![image](https://user-images.githubusercontent.com/70964563/152977350-2ff426d4-4865-4a9b-b2e0-3ac55aafb36a.png)

Not: Sağdaki şekilde bir dirac (ծ) elde edildiği gösterilip soldaki figürde ise genlik ve frekans değerleri gösterilmiştir. İnsert işlemleri figüre elde edildikten sonra gerçekleştirilmiştir.


### 3) Demodülatör 𝐶𝑜𝑠(100𝜋𝑡) taşıyıcısını kullanmaktadır. Demodülatörde AGF girişindeki işaret 𝑒(𝑡)'yi ve spektrumunu çizdiriniz.

![image](https://user-images.githubusercontent.com/70964563/152977418-2e5c6164-ccc0-487d-a171-b07b60538c0e.png)

Yukarıdaki block diagramda da görüldüğü gibi y(t) işaretimizi 𝐶𝑜𝑠(100𝜋𝑡) işareti ile çarparsak çıkışta AGF girişindeki e(t) sinyalini elde edeceğiz. Bu durumda bu işlemleri kodumuza uygularsak;

![image](https://user-images.githubusercontent.com/70964563/152977459-9ee1aa6b-298b-4f03-9d70-61a4c1fd34e6.png)

![image](https://user-images.githubusercontent.com/70964563/152977497-9ce5e389-a7dd-4de0-9ae1-06acaa96da2a.png)


![image](https://user-images.githubusercontent.com/70964563/152977529-c9a46da6-65c1-42a2-a6d2-81bb00b4b4eb.png)


Yukarıdaki kodumuz sayesinde e(t) sinyalimizi zaman domaininden frekans domainine geçirmeyi başardık. Burada yapılan asıl işlem elde edilmiş ve tanımlanmış olan y(t) sinyali ile demodülatör taşıyıcısı sinyalinin elementwise çarpımı için “ .* ” işlemi kullanıldı. E(f) elde edebilmek için Fast Fourier Transform kullanılmıştır. Mutlak değer alarak complex olarak elde edilen çıktıların artık boylarını (karelerinin karekökü) elde edebiliyoruz. Eğer öteleme (fftshift) işlemi sayesinde elde edilen ayrık zamanlı sinyalin sıfır bileşenini spektrumun merkezine kaydırmaktayız. Bu sayede sinyalimiz istediğimiz genlikte ve istediğimiz frekans değerinde aşağıdaki şekildeki gibi görülebilmektedir.

![image](https://user-images.githubusercontent.com/70964563/152977585-0f2054a4-f0f1-4fc1-a56f-78e689b650ac.png)


### 4) Demodülatörde AGF çıkışındaki işaret 𝑧(𝑡)'yi ve spektrumunu çizdiriniz.

![image](https://user-images.githubusercontent.com/70964563/152977625-7fd1b76c-63af-42eb-b3b9-8062b42b4ddd.png)


Yukarıdaki block diagramdan da görüldüğü gibi AGF giriş sinyali olan e(f), bant genişliği m(t) ile aynı olan bir alçak geçiren filtreden geçmektedir. Bu sayede çıkış işareti z(t) elde edilecektir. Bu durumda bu işlemleri kodumuza uygularsak;

![image](https://user-images.githubusercontent.com/70964563/152977703-394511b1-f902-431e-90a5-1a5918093b17.png)
![image](https://user-images.githubusercontent.com/70964563/152977780-9e35f811-ac70-4bfe-a5cc-bde1a6100e70.png)


![image](https://user-images.githubusercontent.com/70964563/152977850-1f964900-a76b-4f6e-a13f-0a03aa5fb8fc.png)


Eğer demodülasyon işlemi doğru yapılsaydı çıkış işareti olan z(t) fonksiyonu mesaj işareti olan m(t)’yi içerecektir. Bu demodulasyon işleminde genliğin herhangi bir önemi olmayıp, AGF’nin bant genişliği ve demodülasyon taşıyıcı işaretinin frekansı önemlidir. AGF için BG = BG{m(t)} = 25Hz olduğu için AGF çıkışında çok çok küçük genlikli bozulma işareti haricinde herhangi bir sinyal olmayacaktır.

**Full Devre Blok Diagram
![image](https://user-images.githubusercontent.com/70964563/152977904-082274a9-043d-4b62-ad0e-3962de176389.png)























