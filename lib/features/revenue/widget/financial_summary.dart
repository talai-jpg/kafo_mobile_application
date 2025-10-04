import 'package:flutter/material.dart';

class FinancialSummaryWidget extends StatelessWidget {
  const FinancialSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ملخص الأداء المالي",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // الصور بجانب بعض
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المخطط الأول
              Expanded(child: _buildPieImage()),

              const SizedBox(width: 16),

              // صورة المخطط الثاني
              Expanded(child: _buildBarImage()),
            ],
          ),
        ],
      ),
    );
  }

  // 🔸 الجزء الأول: صورة المخطط الأول
  Widget _buildPieImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          // الصورة مباشرة
          Image.asset(
            'assets/images/pie_chart.png', // ضع هنا مسار الصورة
            height: 140,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),

          // وسيلة الإيضاح
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              _LegendItem(icon: Icons.build, text: "صيانة", color: Colors.orange),
              _LegendItem(icon: Icons.trending_up, text: "ضرائب", color: Colors.teal),
              _LegendItem(icon: Icons.flash_on, text: "كهرباء", color: Colors.red),
              _LegendItem(icon: Icons.widgets, text: "أخرى", color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  // 🔸 الجزء الثاني: صورة المخطط الثاني
  Widget _buildBarImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // وسيلة الإيضاح
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              _LegendItem(icon: Icons.apartment, text: "عمارة حي البيرومك", color: Color(0xFF007B83)),
              SizedBox(width: 12),
              _LegendItem(icon: Icons.apartment, text: "عمارة حي النسيم", color: Color(0xFF74D3E1)),
            ],
          ),
          const SizedBox(height: 20),

          // الصورة مباشرة بدل الأعمدة
          Image.asset(
            'assets/images/bar_chart.png', // ضع هنا مسار صورة الأعمدة
            height: 180,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

// 🔸 عنصر وسيلة الإيضاح
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text, style: const TextStyle(fontSize: 13)),
        const SizedBox(width: 6),
        Icon(icon, size: 16, color: color),
      ],
    );
  }
}
