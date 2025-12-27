import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> goToHomeScreen()async {
   await Future.delayed(Duration(seconds: 3));
   Navigator.pushNamed(context, '/home-page');
  }

  @override
  void initState() {
    goToHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sushi Man',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 100,),
              Center(child: Image.asset('assets/images/nigiri.png', height: 300)),
              const SizedBox(height: 160,),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Text(
                'Feel the test of the most popular food in japan we can develop our food for the best things with another shop',
                style: GoogleFonts.daiBannaSil(color: Colors.white, fontSize: 16,height: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
