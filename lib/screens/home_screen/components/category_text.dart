import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

class CategoryText extends StatelessWidget {
  final String title;
  final String buttonTitle;
  const CategoryText({
    super.key,
    required this.title,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.kRed,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: AppColors.kRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
