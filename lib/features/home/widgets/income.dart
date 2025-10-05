import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({super.key});

  // الألوان
  static const Color primaryDark = AppColor.primary_400;
  static const Color backgroundLight = Color(0xFFD7E7E0);
  static const Color trackColor = Color(0xFFD8EAD8);

  @override
  Widget build(BuildContext context) {
    // تحديد الحجم
    const double cardHeight = 160;
    const double cardRadius = 15;
    const double progressSize = 120; // حجم المؤشر الدائري
    const double progressStroke = 15; // سُمك المؤشر

    return Container(
      height: cardHeight,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundLight, // لون خلفية الكارد
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        textDirection: TextDirection.rtl, // لضمان ترتيب المحتويات
        children: [
          // 1. الجزء الأيمن: النص وزر التفاصيل
          Positioned(
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إجمالي الدخل',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'لشهر شعبان',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 15),
                // زر التفاصيل
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDark,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'التفاصيل',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          // 2. المؤشر الدائري والنصوص الداخلية
          Positioned(
            left: 20, // تحديد مكانه في اليسار
            child: Stack(
              alignment: Alignment.center,
              children: [
                // المؤشر الدائري نفسه
                SizedBox(
                  width: progressSize,
                  height: progressSize,
                  child: CircularProgressIndicator(
                    value: 0.85, // 85% كقيمة مثال
                    strokeWidth: progressStroke,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      primaryDark,
                    ), // اللون الداكن
                    backgroundColor: trackColor, // لون التتبع (الرمادي الفاتح)
                  ),
                ),
                // النصوص داخل الدائرة
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '15 شعبان',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '20،500',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
