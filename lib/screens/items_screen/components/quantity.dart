import 'package:flutter/cupertino.dart';

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
              children: const [
                Icon(CupertinoIcons.add),
                Text('01'),
                Icon(CupertinoIcons.minus)
              ],
            ),
          )
        ],
      ),
    );
  }
}
