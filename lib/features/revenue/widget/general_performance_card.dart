import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';

class GeneralPerformanceCard extends StatelessWidget {
  final String totalLabel;
  final String totalValue;
  final String growthText;
  final String imagePath;

  const GeneralPerformanceCard({
    super.key,
    this.totalLabel = 'إجمالي الإيرادات',
    this.totalValue = '1.2م',
    this.growthText = '15%+ آخر 12 شهر',
    this.imagePath = 'assets/images/Vector - 1.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            totalLabel,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            totalValue,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: '+15% ',
                  style: TextStyle(
                    color: AppColor.darkGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'آخر 12 شهر',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Image.asset(imagePath, height: 107, fit: BoxFit.contain),
          ),

          const SizedBox(height: 11),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('يناير'),
              Text('فبراير'),
              Text('مارس'),
              Text('أبريل'),
              Text('مايو'),
              Text('يونيو'),
            ],
          ),
        ],
      ),
    );
  }
}
