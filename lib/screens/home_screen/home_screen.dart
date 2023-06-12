import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';
import 'dart:io';

import 'package:shop_air_app/screens/add_product_screen/add_product_screen.dart';
import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kRed,
        elevation: 0,
        title: Text(
          'Awesome Store',
          style: TextStyle(fontSize: 24, color: AppColors.kWhite),
        ),
      ),
      body: GridView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetaliScreen(
                    id: dummyData[i].id,
                    productList: dummyData,
                  ),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: AppColors.kBluee,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.kAmber,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  children: [
                    Expanded(
                      // ovdje dodajemo uslov za prikaz slike i provjeravamo vrijednost isAssetImage u objektu Product u modelu koji imamo
                      // ako je postavljeno na true koristimo Image.asset sa putanjom dummyData.image
                      // ako je false koristimo Image.file sa putanjom dummyData.image
                      child: dummyData[i].isAssetImage
                          ? Image.asset(dummyData[i].image)
                          : Image.file(
                              File(dummyData[i].image),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(dummyData[i].name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(dummyData[i].price),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
      ),
      backgroundColor: AppColors.kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.kRed,
        child: IconButton(
          onPressed: () async {
            final newProduct = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(
                  productList: dummyData,
                ),
              ),
            );
            // uslov za novi prizvod koji nije jednak null tada se izvršava
            // setState kako bih obavjestio dummData lisu da je promjenjena
            // kada se pozove setState flutter ce ponovno iggraditi widget home screen
            // i izvršiti bulid metodu kako bih ažurirao promjene
            // kada dodamo novi prizvod u Grid.builder u home screen ce se ponovno izgraditi sa promjenama  prikazivajuci novi prizvod
            if (newProduct != null) {
              setState(() {
                dummyData.add(newProduct);
              });
            }
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
