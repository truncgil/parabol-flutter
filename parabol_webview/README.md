# Parabol WebView Uygulaması

Bu uygulama, Parabol yazılımına kolay erişim sağlamak için geliştirilmiş bir WebView uygulamasıdır. Hem mobil platformlarda (Android ve iOS) hem de masaüstü platformlarında (Windows, macOS, Linux) çalışacak şekilde tasarlanmıştır.

## Özellikler

- Tam ekran WebView deneyimi
- Sayfa yüklenirken şık bir yükleme göstergesi
- Geri tuşu desteği (WebView geçmişinde gezinme)
- Harici bağlantıların varsayılan tarayıcıda açılması
- Tüm platformlarda tam ekran destek

## Geliştirme

### Gereksinimler

- Flutter SDK (en son sürüm)
- Android Studio veya Visual Studio Code
- Xcode (macOS için)
- Visual Studio (Windows için)

### Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/truncgil/parabol-webview.git
   ```

2. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```

3. Geliştirici Kurulumu:
   
   Android için:
   - `android/key.properties.example` dosyasını `android/key.properties` olarak kopyalayın
   - Yeni bir keystore oluşturun:
     ```bash
     keytool -genkey -v -keystore android/app/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
     ```
   - `key.properties` dosyasını kendi bilgilerinizle güncelleyin

4. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

### Derleme

#### Android için:
```bash
flutter build apk --release  # APK için
flutter build appbundle --release  # Play Store için
```

#### iOS için:
```bash
flutter build ios --release
```

#### Windows için:
```bash
flutter build windows --release
```

#### macOS için:
```bash
flutter build macos --release
```

#### Linux için:
```bash
flutter build linux --release
```

## Güvenlik

- Keystore dosyası (`upload-keystore.jks`) ve `key.properties` dosyası asla git reposuna eklenmemelidir
- Bu dosyalar güvenli bir şekilde saklanmalı ve yedeklenmelidir
- Örnek yapılandırma dosyaları `.example` uzantısıyla sağlanmıştır

## Logo ve Varlıklar

Logo ve diğer varlıklar `assets/images/` klasöründe saklanmalıdır. Uygulamanın logosu ve diğer görsel öğeleri buraya ekleyebilirsiniz.

## Katkıda Bulunma

1. Bu depoyu forklayın
2. Yeni bir özellik dalı oluşturun (`git checkout -b yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik: XYZ'`)
4. Dalınıza push yapın (`git push origin yeni-ozellik`)
5. Bir Pull Request oluşturun

## Lisans

Bu proje özel bir lisans altında dağıtılmaktadır. Tüm hakları saklıdır.

---

Powered by Parabol 