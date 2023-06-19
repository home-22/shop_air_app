//enum ItemType {
//  phones,
//  computers,
//  laptops,
//}

class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String image;
  final bool isAssetImage;
  //ItemType? type;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.isAssetImage,
//    this.type,
  });
}

List<Product> productList = [];
