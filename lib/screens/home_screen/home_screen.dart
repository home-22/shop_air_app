import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

import 'package:shop_air_app/screens/drawer_screen/drawer_screen.dart';

import 'package:shop_air_app/screens/home_screen/components/range_card.dart';
import 'package:shop_air_app/screens/men_screen_gallery/men_gallery_screen.dart';
import 'package:shop_air_app/screens/women_screen.gallery/women_screen_gallery.dart';

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('What'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.kRed,
            indicatorWeight: 5,
            tabs: const [
              RangeCard(title: 'Men'),
              RangeCard(title: 'Women'),
              RangeCard(title: 'Shoes'),
              RangeCard(title: 'Bags')
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MenGalleryScreen(),
            WomenGaleryScreen(),
          ],
        ),
        backgroundColor: AppColors.kWhite,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Scan my Space',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.kWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
