import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/screens/registar_screen/registar_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegistarScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.kWhite,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Image.asset(
                'assets/images/electronics13.jpg',
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Please wait',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColors.kWhite,
            ),
          ),
          const SizedBox(height: 10.0),
          CircularProgressIndicator(
            color: AppColors.kWhite,
          ),
        ],
      ),
    );
  }
}
