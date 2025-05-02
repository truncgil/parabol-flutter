import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'webview_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Tam ekran modunu etkinleştir
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  // Yalnızca dikey yönlendirmeyi zorla
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ParabolApp());
}

class ParabolApp extends StatelessWidget {
  const ParabolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parabol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WebViewScreen(),
    );
  }
}
