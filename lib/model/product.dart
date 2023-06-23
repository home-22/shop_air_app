enum Category {
  phones,
  computers,
  laptops,
  other,
}

class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String image;
  final bool isAssetImage;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.isAssetImage,
    required this.category,
  });
}
