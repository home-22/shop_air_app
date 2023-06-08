import 'package:flutter/material.dart';

class BagsGalleryScreen extends StatefulWidget {
  const BagsGalleryScreen({super.key});

  @override
  State<BagsGalleryScreen> createState() => _BagsGalleryScreenState();
}

class _BagsGalleryScreenState extends State<BagsGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('U izradi'),
      ),
    );
  }
}
