import 'package:flutter/material.dart';
import 'package:shop_air_app/colors/app_colors.dart';

class SuperFlashContener extends StatefulWidget {
  const SuperFlashContener({super.key});

  @override
  State<SuperFlashContener> createState() => _SuperFlashContenerState();
}

class _SuperFlashContenerState extends State<SuperFlashContener> {
  final List<String> images = [
    'electronics0.jpg',
    'electronics1.jpg',
    'electronics2.jpg',
    'electronics3.jpg',
    'electronics4.jpg'
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
                      'assets/images/electronics$index.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                    bottom: 30,
                    child: Text(
                      'Super Flash Sale\n50% Off\n\n 08:34:53',
                      style: TextStyle(
                          color: AppColors.kRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))
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
