import 'package:flutter/material.dart';

class AlertsBoard extends StatelessWidget {
  const AlertsBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'لوحة التنبيهات',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'الكل',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _alertTile(
          icon: Icons.error_outline,
          color: Color(0xffd00416),
          text: 'عطل مصعد - عمارة المزن',
        ),
        const SizedBox(height: 8),
        _alertTile(
          icon: Icons.water_drop_outlined,
          color: const Color(0xFFF9C744),
          text: 'تسريب ماء - فيلا 6 (الدور الأرضي)',
          iconColor: const Color(0xFFB47F00),
        ),
      ],
    );
  }

  Widget _alertTile({
    required IconData icon,
    required Color color,
    required String text,
    Color iconColor = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
