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
   ```
   git clone https://github.com/your-username/parabol_webview.git
   ```

2. Bağımlılıkları yükleyin:
   ```
   flutter pub get
   ```

3. Uygulamayı çalıştırın:
   ```
   flutter run
   ```

### Derleme

#### Android için:
```
flutter build apk --release
```

#### iOS için:
```
flutter build ios --release
```

#### Windows için:
```
flutter build windows --release
```

#### macOS için:
```
flutter build macos --release
```

#### Linux için:
```
flutter build linux --release
```

## Logo ve Varlıklar

Logo ve diğer varlıklar `assets/images/` klasöründe saklanmalıdır. Uygulamanın logosu ve diğer görsel öğeleri buraya ekleyebilirsiniz.

## Lisans

Bu proje özel bir lisans altında dağıtılmaktadır. Tüm hakları saklıdır.

---

Powered by Parabol 