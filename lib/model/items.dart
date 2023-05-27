import 'package:flutter/material.dart';

class Items {
  final String id;
  final String title;
  final String description;
  final String price;
  final String image;
  final List<Color> loadColors;

  const Items({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.loadColors,
  });
}
