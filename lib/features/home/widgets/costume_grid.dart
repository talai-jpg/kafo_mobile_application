import 'package:flutter/material.dart';
import 'package:kafo_app/features/reports/model/complaint_model.dart';
import 'package:kafo_app/features/reports/model/suggestion_model.dart';

import '../../reports/widget/report_card.dart';

class GrideCustome extends StatelessWidget {
  const GrideCustome({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    const double requiredHeight = 300.0;

    return SizedBox(
      height: requiredHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        reverse: false,

        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: list.length,

        itemBuilder: (_, i) {
          final item = list[i];

          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SizedBox(
              width: 160,

              child: ReportCard(
                title: item.title,
                subtitle: item.subtitle,
                imageUrl: item.imageUrl,
                tags: item is Complaint ? item.tags : null,
                status: item is Suggestion ? item.status : null,
                time: item.time,
              ),
            ),
          );
        },
      ),
    );
  }
}
