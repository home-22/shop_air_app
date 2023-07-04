import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 10,
              thickness: 1.5,
              color: AppColors.kGrey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('OR'),
          ),
          Expanded(
            child: Divider(
              height: 10,
              thickness: 1.5,
              color: AppColors.kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
