import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/screens/home_screen/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/electronics13.jpg',
              height: 300,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
            Center(
              child: ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: AppColors.kBlue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Get started')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(
                        color: AppColors.kGrey,
                        fontFamily: 'Helvetica-Bold',
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: 'Sing in ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Helvetica-Bold',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
