import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/reports/data/suggestion_data.dart';
import 'package:kafo_app/features/reports/data/complaint_data.dart';
import 'package:kafo_app/features/reports/model/complaint_model.dart';
import 'package:kafo_app/features/reports/model/suggestion_model.dart';
import 'package:kafo_app/features/reports/screen/widget/gride_card.dart';
import 'package:kafo_app/features/reports/screen/widget/report_card.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  int selectedChip = 1;
  final chipLabels = ["جديدة", "قيد التنفيذ", "منتهية"];

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = SuggestionData.getSuggestions();
    final complaints = ComplaintData.getComplaints();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'التقارير',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tab,
          labelColor: AppColor.primary_400,
          unselectedLabelColor: Colors.grey[500],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'الشكاوى'),
            Tab(text: 'الاقتراحات'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterChips(),
          Expanded(
            child: TabBarView(
              controller: _tab,
              children: [
                GrideScreen(list: complaints),
                GrideScreen(list: suggestions),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: List.generate(
                chipLabels.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ChoiceChip(
                    showCheckmark: false,

                    label: Text(
                      chipLabels[i],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    selected: selectedChip == i,
                    selectedColor: AppColor.chipColor,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: selectedChip == i
                          ? AppColor.primary_400
                          : Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSelected: (_) => setState(() => selectedChip = i),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 30),

        Row(
          children: [
            Icon(Icons.filter_list, color: AppColor.primary_400, size: 22),
            const SizedBox(width: 4),
            Text(
              "فرز",
              style: TextStyle(
                color: AppColor.primary_400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
