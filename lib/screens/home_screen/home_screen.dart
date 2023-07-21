import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';
import 'package:shop_air_app/screens/home_screen/components/bottom_navigator_bar.dart';
import 'package:shop_air_app/screens/home_screen/components/category_card.dart';
import 'package:shop_air_app/screens/home_screen/components/product_display_tab.dart';
//import '../../providers/card_provider.dart';

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
    //  final cardProvider = Provider.of<CardProvider>(context);
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Text(
                          'Make home',
                          style: TextStyle(
                              color: AppColors.kBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: AppColors.kBlue,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.kGrey,
                  ),
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productList = dummyData
                                    .where((element) =>
                                        element.category == Category.phones)
                                    .toList();
                              });
                            },
                            child: const CategoryCard(
                              name: 'phones',
                              image: Image(
                                image: AssetImage(
                                  'assets/images/electronics0.jpg',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productList = dummyData
                                    .where((element) =>
                                        element.category == Category.laptops)
                                    .toList();
                              });
                            },
                            child: const CategoryCard(
                              name: 'laptops',
                              image: Image(
                                image: AssetImage(
                                  'assets/images/electronics2.jpg',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productList = dummyData
                                    .where((element) =>
                                        element.category == Category.computers)
                                    .toList();
                              });
                            },
                            child: const CategoryCard(
                              name: 'computers',
                              image: Image(
                                image: AssetImage(
                                  'assets/images/electronics1.jpg',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productList = dummyData
                                    .where((element) =>
                                        element.category == Category.other)
                                    .toList();
                              });
                            },
                            child: const CategoryCard(
                              name: 'other',
                              image: Image(
                                image: AssetImage(
                                  'assets/images/electronics9.jpg',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProductDisplayTab(
                    productList: productList,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigatorBar(),
          ),
        ),
      ),
    );
  }
}
