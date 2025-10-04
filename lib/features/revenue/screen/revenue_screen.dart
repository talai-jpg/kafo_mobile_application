import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/revenue/widget/financial_summary.dart';
import 'package:kafo_app/features/revenue/widget/general_performance_card.dart';
import 'package:kafo_app/features/revenue/widget/stats_card.dart';

class RevenueScreen extends StatefulWidget {
  const RevenueScreen({super.key});

  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.lightblue),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColor.black, size: 20),
            onPressed: () {},
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المالية',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: AppColor.black),
                    ),
                    Image.asset(
                      'assets/images/brightness_low.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                SizedBox(height: 27),
                Text(
                  'مؤشرات رئيسية',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    StatsCard(
                      value: "620,000 ﷼",
                      title: "إجمالي الإيرادات",
                      backgroundImage: "assets/images/riyalImage.png",
                    ),
                    SizedBox(width: 8),
                    StatsCard(
                      value: "83%",
                      title: "نسبة الإشغال",
                      backgroundImage: "assets/images/riyalImage.png",
                    ),
                  ],
                ),
                SizedBox(height: 49),

                Text(
                  'الاداء العام',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(fontSize: 18),
                ),
                SizedBox(height: 12),

                GeneralPerformanceCard(),
                SizedBox(height: 35),
                Text(
                  "ملخص الأداء المالي",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
