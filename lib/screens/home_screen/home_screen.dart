import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.black,
          ),
        ),
        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Categories',
                style: TextStyle(fontFamily: 'Helvetica', color: Colors.black),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
                [Text('Price Range'), Text('Tags'), Text('Style')]),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(1),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildListDelegate(
                [
                  for (int i = 0; i < 4; i++)
                    Card(
                      child: Text('Red'),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
