import 'package:flutter/material.dart';
import 'package:kafo_app/features/home/screen/home_screen.dart';
import 'package:kafo_app/features/property/screen/property_screen.dart';
import 'package:kafo_app/features/reports/screen/reports_screen.dart';
import 'package:kafo_app/features/revenue/screen/revenue_screen.dart';

class NavigationController {
  int currentIndex = 0;


  NavigationController();

  late final List<Widget> screens = [
    HomeScreen(userName: ' '),
    ReportsScreen(),
    PropertiesScreen(),
    RevenueScreen(),
  ];
}
