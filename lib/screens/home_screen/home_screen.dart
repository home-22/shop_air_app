import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';
import 'package:shop_air_app/data/dummy_data_list.dart';
import 'package:shop_air_app/screens/product_detail_screen/product_detail_screen.dart';

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
          title: Text(
            'Awesome Store',
            style: TextStyle(fontSize: 24, color: AppColors.kWhite),
          ),
        ),
        body: GridView.builder(
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: AppColors.kBluee,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.kAmber,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(dummyData[i].image),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dummyData[i].name),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dummyData[i].price),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1),
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
