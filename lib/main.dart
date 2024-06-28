import 'package:demo/presentation/pages/auth/login_page.dart';
import 'package:demo/presentation/pages/main/main.dart';
import 'package:demo/presentation/pages/splash_page/splash.dart';
import 'package:flutter/material.dart';

import 'domain/local/shared/mypref.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  MySharedPref.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => const SplashScreen(),
        'login': (BuildContext context) => const LoginScreen(),

        'main' : (BuildContext context) => const MainScreen(),
      },
    );
  }
}