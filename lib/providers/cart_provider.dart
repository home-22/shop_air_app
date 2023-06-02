import 'package:flutter/material.dart';
import 'package:shop_air_app/model/product_model.dart';

class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  List<Product> get getItems {
    return _list;
  }

  double get totalPrice {
    var total = 0.0;
    for (var item in _list) {
      total += item.price * item.qty;
    }
    return total;
  }

  int? get count {
    return _list.length;
  }

  void addItem(
    String name,
    double price,
    int qty,
    int qntty,
    List imagesUrl,
    String documentId,
  ) {
    final product = Product(
        name: name,
        description: '',
        price: price,
        qty: qty,
        qntty: qntty,
        documentId: documentId,
        imageUrl: imagesUrl);
    _list.add(product);
    notifyListeners();
  }

  void increment(Product product) {
    product.decrease();
    notifyListeners();
  }

  void reduceByOne(Product product) {
    _list.remove(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _list.remove(product);
    notifyListeners();
  }
}
