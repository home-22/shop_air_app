// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

import 'package:shop_air_app/screens/home_screen/components/bottom_navigator_bar.dart';
import 'package:shop_air_app/screens/home_screen/components/category_card.dart';
import 'package:shop_air_app/screens/home_screen/components/product_display_tab.dart';
import 'package:shop_air_app/screens/home_screen/components/search_box.dart';
import 'package:shop_air_app/screens/home_screen/components/super_flash_container.dart';
import '../../providers/card_provider.dart';

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
    final cardProvider = Provider.of<CardProvider>(context);
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Scaffold(
            body: Consumer<CardProvider>(
              builder: (context, cardProvider, _) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SearchBox(),
                      Divider(
                        color: AppColors.kGrey,
                      ),
                      const SuperFlashContener(),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'More Category',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              //  for (int i = 0; i <= 4; i++)
                              CategoryCard(
                                name: 'phones',
                                image: const Image(
                                  image: AssetImage(
                                    'assets/images/electronics0.jpg',
                                  ),
                                ),
                              ),
                              CategoryCard(
                                name: 'laptops',
                                image: const Image(
                                  image: AssetImage(
                                    'assets/images/electronics2.jpg',
                                  ),
                                ),
                              ),
                              CategoryCard(
                                name: 'computers',
                                image: const Image(
                                  image: AssetImage(
                                    'assets/images/electronics1.jpg',
                                  ),
                                ),
                              ),
                              CategoryCard(
                                name: 'other',
                                image: const Image(
                                  image: AssetImage(
                                    'assets/images/electronics9.jpg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ProductDisplayTab(productList: productList),
                    ],
                  ),
                );
              },
            ),
            bottomNavigationBar: const BottomNavigatorBar(),
          ),
        ),
      ),
    );
  }
}
