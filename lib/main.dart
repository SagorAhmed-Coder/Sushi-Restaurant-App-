import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/pages/home_page.dart';
import 'package:sushi_restaurant/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      builder: (context,value) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/' : (context) => SplashScreen(),
            '/home-page' : (context) => HomePage(),
          },
        );
      }
    );
  }
}
