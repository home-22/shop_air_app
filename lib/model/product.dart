class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String image;
  final bool isAssetImage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.isAssetImage,
  });
}

List<Product> productList = [];
// productList je prazna list objekta tipa Product
// mozemo pohraniti više instanci  klase Product
//  dadajemo  tako pomocu metode add productList.add(product1 );
