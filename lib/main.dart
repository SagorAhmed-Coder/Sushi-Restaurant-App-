import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/quantity_controller.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop(),),
        ChangeNotifierProvider(create: (context) => QuantityController(),),
      ],
      builder: (context,value) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/' : (context) => SplashScreen(),
            '/home-page' : (context) => HomePage(),
         //   '/food-details-page' : (context) => FoodDetailsPage(),
          },
        );
      }
    );
  }
}
