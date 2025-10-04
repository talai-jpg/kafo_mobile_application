import 'package:flutter/material.dart';
import 'package:kafo_app/features/reports/model/complaint_model.dart';
import 'package:kafo_app/features/reports/model/suggestion_model.dart';
import 'package:kafo_app/features/reports/screen/widget/report_card.dart';

class GrideScreen extends StatelessWidget {
  const GrideScreen({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, i) {
          final item = list[i];

          return ReportCard(
            title: item.title,
            subtitle: item.subtitle,
            imageUrl: item.imageUrl,
            tags: item is Complaint ? item.tags : null,
            status: item is Suggestion ? item.status : null,
            time: item.time,
          );
        },
      ),
    );
  }
}
