import 'dart:io';

import 'package:flutter/material.dart';
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
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
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
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 40),
                    height: 210,
                    width: 210,
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kBluee,
                          blurRadius: 25,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child:
                        // Ako selectedImage nije null  jeste asset slika,
                        // prikazujemo sliku koristeći Image.asset()

                        CircleAvatar(
                      maxRadius: 60,
                      backgroundColor: AppColors.kAmber,
                      child: product.isAssetImage
                          ? Image.asset(
                              product.image,
                              filterQuality: FilterQuality.high,
                              height: 100,
                              width: 100,
                            )
                          : Image.file(
                              File(product.image),
                              filterQuality: FilterQuality.high,
                              height: 100,
                              width: 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  product.image,
                                  height: 100,
                                  width: 100,
                                );
                              },
                            ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(product.price),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: AppColors.kRed,
                      child: Icon(
                        Icons.delete,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
