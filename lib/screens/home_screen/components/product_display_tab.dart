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
      height: 700,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
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
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: AppColors.kDark,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(6.0),
              ),
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(2.0),
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0),
                          ),
                          child: product.isAssetImage
                              ? Image.asset(
                                  product.image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(product.image),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      product.image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlue,
                      ),
                    ),
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
