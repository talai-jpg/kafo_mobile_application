import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // لا تظهر زر الرجوع
      backgroundColor: Colors.white,
      elevation: 0, // إزالة الظل
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // صورة/رمز الملف الشخصي
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Text('م'),
          ),
          const SizedBox(width: 8.0),

          // معلومات المستخدم
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مساء الخير',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'أهلاً محمد!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const Spacer(), // دفع العناصر لليسار
          // زر الإشعارات مع النقطة الحمراء
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
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
