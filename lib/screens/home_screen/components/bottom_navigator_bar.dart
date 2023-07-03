import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/providers/product_search_provider.dart';
import 'package:shop_air_app/screens/add_product_screen/add_product_screen.dart';
import 'package:shop_air_app/screens/cart_%20screen/cart_screen.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<ProductSearchProvider>(
              builder: (context, productSearchProvider, _) {
                return SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      productSearchProvider.searchProducts(dummyData);
                    },
                    icon: Icon(
                      Icons.home_filled,
                      color: AppColors.kBlue,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: AppColors.kBlue,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.kBlue,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(
                        orderProducts: [],
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.local_offer_outlined,
                  color: AppColors.kBlue,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person_rounded,
                  color: AppColors.kBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
