import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/screens/home_screen/home_screen.dart';

import 'package:shop_air_app/screens/registar_screen/components/button_in.dart';
import 'package:shop_air_app/screens/registar_screen/components/divider_or.dart';

class RegistarScreen extends StatelessWidget {
  const RegistarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/electronics13.jpg',
              height: 200,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
            const Text(
              'Welcome to Lafyuu',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Helvetica-Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Helvetica-Bold',
                  color: AppColors.kGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Your Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.local_mall_outlined),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ButtonIn(title: 'Sing In'),
              ),
            ),
            const DividerOr(),
            ButtonIn(
              title: 'Login with Google',
              textColor: AppColors.kGrey,
              buttonColor: AppColors.kWhite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonIn(
                title: 'Login with facebook',
                textColor: AppColors.kGrey,
                buttonColor: AppColors.kWhite,
              ),
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(
                color: AppColors.kBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                text: "Don't have a account?",
                style: TextStyle(
                  color: AppColors.kGrey,
                ),
                children: [
                  TextSpan(
                    text: "Register",
                    style: TextStyle(
                      color: AppColors.kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
