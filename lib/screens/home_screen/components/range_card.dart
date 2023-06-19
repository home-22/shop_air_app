import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

class RangeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const RangeCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        height: 30,
        width: 110,
        decoration: BoxDecoration(
          color: AppColors.kRed.withOpacity(0.1),
          boxShadow: [BoxShadow(blurRadius: 12, color: AppColors.kBlue)],
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          border: Border.all(color: AppColors.kWhite),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                icon,
                color: AppColors.kWhite,
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                title,
                style: TextStyle(color: AppColors.kWhite),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
