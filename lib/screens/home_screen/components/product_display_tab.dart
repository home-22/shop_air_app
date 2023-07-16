import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';

import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';

import '../../../model/product.dart';

// Kartica za prikaz prizvoda iz liste
// ignore: must_be_immutable
class ProductDisplayTab extends StatelessWidget {
  List<Product> productList = dummyData;

  ProductDisplayTab({
    super.key,
    required this.productList,
  });

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
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.kGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                    ),
                    child: SizedBox(
                      height: 90,
                      width: 130,
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
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlue,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          maxRating: 1,
                          itemCount: 5,
                          itemSize: 18,
                          allowHalfRating: true,
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                              color: AppColors.kAmber,
                            );
                          },
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlue,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          product.price,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            //boja prekrizene linije
                            decorationColor: AppColors.kGrey,
                            // debljina linije
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '24 % off',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.kRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
