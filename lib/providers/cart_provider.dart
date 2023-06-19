import 'package:flutter/material.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';

import 'package:shop_air_app/model/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> dummyDate = [];

  List<Product> get getItems {
    return [...dummyDate];
  }

  List<Product> get items => dummyDate;
  int? get count {
    return dummyDate.length;
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
    dummyDate.removeAt(index);
    notifyListeners();
  }
}
