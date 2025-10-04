import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/navigation/controller/nav_controller.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late NavigationController controller;

  @override
  void initState() {
    super.initState();
    controller = NavigationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (index) {
          setState(() {
            controller.currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primary_400,
        unselectedItemColor: AppColor.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "التقارير",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "الممتلكات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "المالية",
          ),
        ],
      ),
      body: controller.screens[controller.currentIndex],
    );
  }
}