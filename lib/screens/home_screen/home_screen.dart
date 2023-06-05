import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

import 'package:shop_air_app/screens/drawer_screen/drawer_screen.dart';

import 'package:shop_air_app/screens/home_screen/components/range_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
      .collection('products')
      .where('mainCateg', isEqualTo: 'accessories')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kBlue,
        elevation: 0,
        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Categories',
                style:
                    TextStyle(fontFamily: 'Helvetica', color: AppColors.kBlack),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.kBlack,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      RangeCard(title: 'Men'),
                      RangeCard(title: 'Women'),
                      RangeCard(title: 'Shoes'),
                      RangeCard(title: 'Kids'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
    );
  }
}
