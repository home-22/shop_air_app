import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quantity extends StatelessWidget {
  const Quantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Quantity'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.add),
                  onPressed: () {},
                ),
                Text('01'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.minus),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
