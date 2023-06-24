import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> orderProducts;
  const CartScreen({
    super.key,
    required this.orderProducts,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Product> productList = widget.orderProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext context, index) {
            final product = productList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.kGrey.withRed(240),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: AppColors.kAmber,
                          child: product.isAssetImage
                              ? Image.asset(
                                  product.image,
                                  filterQuality: FilterQuality.high,
                                  height: 70,
                                  width: 70,
                                )
                              : Image.file(
                                  File(product.image),
                                  filterQuality: FilterQuality.high,
                                  height: 70,
                                  width: 70,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      product.image,
                                      height: 70,
                                      width: 70,
                                    );
                                  },
                                ),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(color: AppColors.kWhite),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.price,
                            style: TextStyle(color: AppColors.kWhite),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.kWhite,
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
