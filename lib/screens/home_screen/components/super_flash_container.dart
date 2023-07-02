import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

DateTime now = DateTime.now();
int hours = now.hour;
int minutes = now.minute;
int seconds = now.second;

class SuperFlashContener extends StatefulWidget {
  const SuperFlashContener({super.key});

  @override
  State<SuperFlashContener> createState() => _SuperFlashContenerState();
}

class _SuperFlashContenerState extends State<SuperFlashContener> {
  final List<String> images = [
    'electronicss0.jpg',
    'electronicss1.jpg',
    'electronicss2.jpg',
    'electronicss3.jpg',
    'electronicss4.jpg',
  ];
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(6.0),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      'assets/images/electronicss$index.jpg',
                      fit: BoxFit.contain,
                    );
                  },
                ),
                Positioned(
                    bottom: 50,
                    left: 30,
                    child: Text(
                      'Super Flash Sale\n50% Off\n',
                      style: TextStyle(
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text('$hours'),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.kWhite,
                        ),
                        child: Center(
                          child: Text('$minutes'),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.kWhite,
                        ),
                        child: Center(
                          child: Text('$seconds'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PageIndicator(
            count: images.length,
            currentIndex: _currentPage,
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? AppColors.kBlue : AppColors.kGrey,
            ),
          );
        },
      ),
    );
  }
}
