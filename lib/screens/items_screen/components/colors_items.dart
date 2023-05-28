import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
              children: const [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.amber,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
