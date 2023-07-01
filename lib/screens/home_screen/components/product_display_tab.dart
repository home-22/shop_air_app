import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';

// Kartica za prikaz prizvoda iz liste
// ignore: must_be_immutable
class ProductDisplayTab extends StatelessWidget {
  List<Product> productList = dummyData;
  ProductDisplayTab({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetaliScreen(
                    id: product.id,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: product.isAssetImage
                          ? Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(product.image),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBluee),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      product.price,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBlue),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: RatingBar.builder(
                            initialRating: 0,
                            maxRating: 1,
                            itemCount: 5,
                            itemSize: 14,
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: 7.0,
                              vertical: 6.0,
                            ),
                            allowHalfRating: true,
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: AppColors.kAmber,
                              );
                            },
                            onRatingUpdate: (rating) {
                              print(rating);
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
