import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cuponera_fl/routes/routes.dart';
import 'package:cuponera_fl/themes/themes.dart';

void main() async {
  /* Estas lineas utilizan el paquete Services de flutter
  para impedir que se gire el dispositivo
  */
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuponera FL',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initialRoute,
      // home: const HomeScreen(),
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
