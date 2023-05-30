import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/screens/home_screen/components/range_card.dart';
import 'package:shop_air_app/screens/items_screen/items_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
            delegate: SliverChildListDelegate([
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
              )
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(2.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildListDelegate(
                [
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ItemsScreen(),
                          ),
                        );
                      },
                      child: Scaffold(
                        backgroundColor: AppColors.kWhite,
                        body: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      radius: 12,
                                      child: Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.kRed,
                                        ))
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/003.png',
                                      fit: BoxFit.cover,
                                      height: 160,
                                    ),
                                    const Positioned(
                                      bottom: 20,
                                      left: 0,
                                      child: Text('Chars'),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 20,
                                      child: Text(
                                        ' \$ 143._',
                                        style: TextStyle(
                                          color: AppColors.kBlue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
                //backgroundColor: AppColors.kBlue,
                color: AppColors.kWhite,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
