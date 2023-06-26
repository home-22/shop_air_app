import 'package:flutter/material.dart';

import 'package:shop_air_app/model/product.dart';

class ButtonAddToCard extends StatelessWidget {
  final Product product;
  const ButtonAddToCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add to Card'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
