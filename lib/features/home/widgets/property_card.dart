import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/home/controller/propety.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // الألوان المستخدمة من التصميم
    const Color primaryColor = Color(0xFF387E4C); // الأخضر الداكن
    const Color lightGreenColor = AppColor.primary_600;

    // العرض المطلوب للبطاقة الواحدة
    const double cardWidth = 300;
    const double cardHeight = 180;

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: const EdgeInsets.only(left: 10), // مسافة بين البطاقات

      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          15,
        ), // تطبيق الحواف الدائرية على الكارد بالكامل
        child: Row(
          children: [
            // 2. الجزء الأيمن: النص والتفاصيل (يأخذ 60% من العرض تقريباً)
            Expanded(
              flex: 6,
              child: Container(
                color: lightGreenColor, // لون الخلفية الأخضر الفاتح
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // اسم العقار
                    Text(
                      property.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    // حالة الإشغال (مع الدائرة الخضراء)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          property.status,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 6),
                        const CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              primaryColor, // الدائرة الخضراء الصغيرة
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // زر التفاصيل
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary_400,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
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
            ),
            // 1. الجزء الأيسر: الصورة (يأخذ 40% من العرض تقريباً)
            Expanded(
              flex: 4,
              child: Image.asset(
                property.imagePath,
                fit: BoxFit.cover,
                height: cardHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
