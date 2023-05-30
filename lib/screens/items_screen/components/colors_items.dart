import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

class ColorsItems extends StatelessWidget {
  const ColorsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Colors'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.kAmber,
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.kRed,
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.kBlue,
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.kBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
