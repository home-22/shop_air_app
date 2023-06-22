// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

import 'package:shop_air_app/screens/edit_product_screen/edit_product_screen.dart';

import 'package:shop_air_app/screens/product_detail_screen/components/colors_items.dart';
import 'package:shop_air_app/screens/product_detail_screen/components/quantity.dart';
import 'dart:io';

class ProductDetaliScreen extends StatelessWidget {
  final String id;
  const ProductDetaliScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // metoda firstWhere uzima funkciju (anonimnu u ovom slucaju)
    //  koja prima element iz liste i provjerava njegaov id jel jednak traženom id
    // kada pronađe prvi element koji odgovara tom uvjetu vraća taj element

    // varijabla. product sadrži prvi prizvod iz liste dummyData čije id odgovara id koji smo prosljedili
    // konstruktoru ProductDetailScrenn i taj se prizvod prikazuje na ekranu ProductDatailScreen
    final Product product = dummyData.firstWhere(
      (product) => product.id == id,
    );
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProductScreen(
                              product: product,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              // dadajemo uslov slike za prikaz provjeravamo vrijednost isAssetImage
              //ako je postavljeno na true koristimo Image.asset sa putanjom product image

              // ako je false koristimo Image.file sa istom putanjom
              // na taj način prilagodimo prikaz slike na temelju vrijednosti isAssetImage
              product.isAssetImage
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        product.image,
                        height: 260,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(
                          product.image,
                        ),
                        height: 260,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            product.image,
                            height: 260,
                          );
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Text(
                  product.price,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.kGrey,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Quantity(),
                  ColorsItems(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
