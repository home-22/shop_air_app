import 'package:flutter/material.dart';

import 'package:shop_air_app/model/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> dummyData = [];

  List<Product> get getItems {
    return [...dummyData];
  }

  List<Product> get items => dummyData;
  int? get count {
    return dummyData.length;
  }

  void addItem(Product newProduct) {
    dummyData.add(newProduct);
    notifyListeners();
  }

  void updatedItem(Product updatedProduct) {
    final index =
        dummyData.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      dummyData[index] = updatedProduct;
    }
    notifyListeners();
  }

  void removeItem(int index) {
    dummyData.removeAt(index);
    notifyListeners();
  }
}
