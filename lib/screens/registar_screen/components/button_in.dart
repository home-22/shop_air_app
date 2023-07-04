import 'package:flutter/material.dart';

import 'package:shop_air_app/colors/app_colors.dart';

class ButtonIn extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final String? icon;
  const ButtonIn({
    super.key,
    required this.title,
    this.buttonColor,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: buttonColor ?? AppColors.kBlue,
        border: Border.all(color: AppColors.kGrey, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.kWhite,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
