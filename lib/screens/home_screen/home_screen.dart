// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';
import 'dart:io';
import 'package:shop_air_app/screens/add_product_screen/add_product_screen.dart';
import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';
import '../../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = dummyData;

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kRed,
        elevation: 0,
        title: Text(
          'Awesome Store',
          style: TextStyle(fontSize: 24, color: AppColors.kWhite),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
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
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      children: [
                        Text(product.name),
                        Row(
                          children: [
                            // Ako selectedImage nije null  jeste asset slika,
                            // prikazujemo sliku koristeći Image.asset()
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: product.isAssetImage
                                  ? Image.asset(
                                      product.image,
                                      filterQuality: FilterQuality.high,
                                    )
                                  : Image.file(
                                      File(product.image),
                                      filterQuality: FilterQuality.high,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(product.image);
                                      },
                                    ),
                            ),

                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(product.price),
                            ),
                            IconButton(
                                onPressed: () {
                                  // brisemo prizvod sa liste koristci index prizvoda
                                  // setState koristimo da aziriramo listu  nakon brisana
                                  setState(() {
                                    productList.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.kRed,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: AppColors.kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.kRed,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            size: 28,
          ),
        ),
      ),
    );
  }
}
