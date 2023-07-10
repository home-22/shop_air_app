import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final Image image;
  const CategoryCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: image,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}
