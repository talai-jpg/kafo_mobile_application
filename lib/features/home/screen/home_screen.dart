import 'package:flutter/material.dart';
import 'package:kafo_app/features/home/widgets/costome_appar.dart';
import 'package:kafo_app/features/home/widgets/costume_grid.dart';
import 'package:kafo_app/features/home/widgets/income.dart';
import 'package:kafo_app/features/reports/data/complaint_data.dart';
import 'package:kafo_app/features/reports/data/suggestion_data.dart';
import 'package:kafo_app/features/reports/screen/widget/gride_card.dart';

import '../widgets/propertie_section.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final complaints = ComplaintData.getComplaints();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تقارير جديدة  📌',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'عرض الكل',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            GrideCustome(list: complaints),

            Padding(
              padding: const EdgeInsets.only(right: 20, top: 30),
              child: Text(
                "الممتلكات",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            PropertiesSection(),

            Padding(
              padding: const EdgeInsets.only(right: 20, top: 30),
              child: Text(
                "الدخل",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4),

            const IncomeCard(),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
