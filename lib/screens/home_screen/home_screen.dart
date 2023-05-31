import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

import 'package:shop_air_app/screens/home_screen/components/range_card.dart';
import 'package:shop_air_app/screens/items_screen/items_screen.dart';

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
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_outlined,
            color: AppColors.kBlack,
          ),
        ),
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
                      RangeCard(title: 'Price Range'),
                      RangeCard(title: 'Tags'),
                      RangeCard(title: 'Style'),
                      RangeCard(title: 'Color'),
                    ],
                  ),
                ),
                SizedBox(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.99,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (int i = 1; i < 11; i++)
                        Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ItemsScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/$i.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text('It de not ver'),
                                )
                              ],
                            )),
                    ],
                  ),
                )
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
