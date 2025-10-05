import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafo_app/app_color.dart';

class FinancialSummaryWidget extends StatelessWidget {
  const FinancialSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildCard1()),

            SizedBox(width: 5),

            Expanded(child: _buildCard2()),
          ],
        ),
      ],
    );
  }

  Widget _buildCard1() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.75),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const _LegendItem(
                icon: Icons.location_city,
                text: "عمارة حي اليرموك",
                color: AppColor.blue,
              ),
              _LegendItem(
                icon: Icons.location_city,
                text: "عمارة حي النسيم",
                color: AppColor.tertiary,
              ),
            ],
          ),
          const SizedBox(height: 24),

          Center(
            child: SvgPicture.asset(
              'assets/images/financal_summary.svg',
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard2() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(4.75),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _LegendItem(
                icon: Icons.build,
                text: "صيانة",
                color: AppColor.darkYellow,
              ),
              _LegendItem(
                icon: Icons.trending_up,
                text: "ضرائب",
                color: AppColor.blue_50,
              ),
              _LegendItem(
                icon: Icons.flash_on,
                text: "كهرباء",
                color: AppColor.darkRed,
              ),
              _LegendItem(
                icon: Icons.widgets,
                text: "أخرى",
                color: AppColor.primary_500,
              ),
            ],
          ),

          Center(
            child: SvgPicture.asset(
              'assets/images/chart 3 (3).svg',
              height: 160,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _LegendItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(text, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
