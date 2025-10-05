import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // 1. تحديد حجم الـ Container ليكون أكبر قليلاً من الـ CircleAvatar
            // إذا كانت الدائرة الداخلية 20 (الـ radius الافتراضي)، نجعل الحجم 44 (22 * 2)
            width: 68,
            height: 50,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // 2. إضافة الحدود (الـ Border)
              border: Border.all(
                color:
                    AppColor.primary_400, // <--- لون الإطار (مثال: أزرق سماوي)
                width: 1.0, // <--- سمك الإطار
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white, // لون خلفية الدائرة الداخلية
              child: Text(
                'م',
                style: TextStyle(color: Colors.black), // لون نص الحرف
              ),
            ),
          ),
          const SizedBox(width: 8.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مساء الخير', style: Theme.of(context).textTheme.titleSmall),
              Text(
                'أهلاً محمد!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          const Spacer(), // دفع العناصر لليسار
          // زر الإشعارات مع النقطة الحمراء
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppColor.primary_400,
                ),
                onPressed: () {},
              ),
              const Positioned(
                right: 12,
                top: 12,
                child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
