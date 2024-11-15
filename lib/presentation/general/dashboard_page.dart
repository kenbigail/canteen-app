import 'package:canteen_app/core/constants/colors.dart';
import 'package:canteen_app/presentation/home/pages/home_page.dart';
import 'package:canteen_app/presentation/order/pages/order_page.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<Widget> pages = [
    HomePage(),
    OrderPage(),
  ];

  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          selectedItemColor: AppColors.primary,
          onTap: (index){
          setState(() {
            selectedIndex = index;
          });
          },
          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.homeIcon.svg(width: 25, height: 25, colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.cart.svg(width: 25, height: 25, colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
              label: 'Order',
            ),
          ]),
    );
  }
}
