// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/model/product.dart';

import 'package:shop_air_app/screens/home_screen/components/bottom_navigator_bar.dart';
import 'package:shop_air_app/screens/home_screen/components/search_box.dart';
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
        child: Scaffold(
          body: Consumer<CardProvider>(
            builder: (context, cardProvider, _) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SearchBox(),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.kBlue,
                    )
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: const BottomNavigatorBar(),
        ),
      ),
    );
  }
}
