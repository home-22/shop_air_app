import 'package:flutter/material.dart';

class RangeCard extends StatelessWidget {
  final String title;
  const RangeCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        height: 30,
        width: 110,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(spreadRadius: 0.1, blurRadius: 1.5, color: Colors.black87),
        ], borderRadius: BorderRadius.circular(5.0), color: Colors.white70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.align_vertical_bottom_outlined),
            SizedBox(width: 10),
            Text(
              title,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
