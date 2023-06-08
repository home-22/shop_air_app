import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';

import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';

class MenGalleryScreen extends StatefulWidget {
  const MenGalleryScreen({
    super.key,
  });

  @override
  State<MenGalleryScreen> createState() => _MenGalleryScreenState();
}

class _MenGalleryScreenState extends State<MenGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetaliScreen(id: dummyData[i].id),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(color: AppColors.kBluee),
                    ),
                    Positioned(
                      right: 10,
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset(
                          dummyData[i].image,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      right: 30,
                      child: Column(
                        children: [
                          Text(
                            dummyData[i].name,
                            style: TextStyle(color: AppColors.kWhite),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              dummyData[i].price,
                              style: TextStyle(color: AppColors.kWhite),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
