import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final String initialUrl = 'https://app.parabol.truncgil.com';
  bool isLoading = true;
  bool hasError = false;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  Future<void> initWebView() async {
    controller = WebViewController();

    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    // Güvenlik ayarları
    await controller.setBackgroundColor(const Color(0xFF265AA5));
    await controller.enableZoom(false);
    await controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          print('Sayfa yükleniyor: $url');
          setState(() {
            isLoading = true;
            hasError = false;
          });
        },
        onPageFinished: (String url) {
          print('Sayfa yüklendi: $url');
          setState(() {
            isLoading = false;
          });
        },
        onWebResourceError: (WebResourceError error) {
          print('Hata oluştu: ${error.description} (${error.errorCode})');
          setState(() {
            hasError = true;
            isLoading = false;
          });
        },
        onNavigationRequest: (NavigationRequest request) {
          print('Navigation request: ${request.url}');
          if (!request.url.contains('parabol.truncgil.com')) {
            print('Engellenen URL: ${request.url}');
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

    try {
      await controller.loadRequest(Uri.parse(initialUrl), headers: {
        'User-Agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
        'Accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
        'Accept-Language': 'tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7',
        'Cache-Control': 'no-cache',
        'Pragma': 'no-cache'
      });
    } catch (e) {
      print('Yükleme hatası: $e');
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  Future<void> reloadPage() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      await controller.reload();
      print('Sayfa yeniden yükleniyor...');
    } catch (e) {
      print('Yeniden yükleme hatası: $e');
      setState(() {
        hasError = true;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF265AA5),
        body: SafeArea(
          top: true,
          bottom: false,
          left: false,
          right: false,
          child: Stack(
            children: [
              WebViewWidget(
                controller: controller,
              ),
              if (isLoading)
                const Center(
                  child: SpinKitCircle(color: Colors.white, size: 50.0),
                ),
              if (hasError)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sayfa yüklenirken bir hata oluştu',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'URL: $initialUrl',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF265AA5),
                        ),
                        onPressed: reloadPage,
                        child: const Text('Tekrar Dene'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
