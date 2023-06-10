import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';
import 'package:shop_air_app/screens/product_detail_screen/components/colors_items.dart';
import 'package:shop_air_app/screens/product_detail_screen/components/quantity.dart';

class ProductDetaliScreen extends StatelessWidget {
  final String id;
  const ProductDetaliScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final Product product = dummyData.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Image.asset(product.image),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              //  Padding(
              //    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              //    child: Text(product.description),
              //  ),
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
