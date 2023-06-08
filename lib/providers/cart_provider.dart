import 'package:flutter/material.dart';
import 'package:shop_air_app/model/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  List<Product> get getItems {
    return _list;
  }

  int? get count {
    return _list.length;
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
