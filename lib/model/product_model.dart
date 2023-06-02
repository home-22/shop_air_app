class Product {
  String name;
  String description;
  double price;
  int qty = 1;
  int qntty;
  String documentId;
  List imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.qty,
    required this.qntty,
    required this.documentId,
    required this.imageUrl,
  });

  void incrase() {
    qty++;
  }

  void decrease() {
    qty--;
  }
}
