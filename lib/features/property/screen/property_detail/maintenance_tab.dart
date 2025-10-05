import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/property/models/property_model.dart';

class MaintenanceTab extends StatelessWidget {
  final Property property;

  const MaintenanceTab({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final aspectRatio = screenWidth / (screenHeight / 1.7);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.add_circle_outline, color: AppColor.primary_400),
              SizedBox(width: 6),
              Text(
                'إضافة بلاغ جديد',
                style: TextStyle(
                  color: AppColor.primary_400,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Filter Chips
          Wrap(
            spacing: 8,
            children: [
              _filterChip('الكل', selected: true),
              _filterChip('عاجل'),
              _filterChip('قيد التنفيذ'),
              _filterChip('منجز'),
            ],
          ),
          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: aspectRatio,
            children: [
              _maintenanceCard(
                context,
                title: 'تسريب ماء',
                description: 'شقة 12 - الدور الأرضي - عمارة النور',
                priority: 'عاجل',
                priorityColor: Color(0xffd00416),
                supervisor: 'أحمد. س. سباكة',
                location: 'الرياض - حي النور',
                date: '01/02/2024',
                duration: '3 أيام',
              ),
              _maintenanceCard(
                context,
                title: 'انقطاع كهرباء الدور الأرضي',
                description: 'شقة 12 - الدور الأرضي - عمارة النور',
                priority: 'قيد التنفيذ',
                priorityColor: Color(0xffdfb400),
                supervisor: 'أحمد. س. كهرباء',
                location: 'الرياض - حي النور',
                date: '01/02/2024',
                duration: '5 أيام',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Filter Chip
  static Widget _filterChip(String label, {bool selected = false}) {
    return Chip(
      label: Text(label),
      backgroundColor: selected ? AppColor.primary_400 : Colors.grey[200],
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black87,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _maintenanceCard(
    BuildContext context, {
    required String title,
    required String description,
    required String priority,
    required Color priorityColor,
    required String supervisor,
    required String location,
    required String date,
    required String duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status chip
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: priorityColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                priority,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Title
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),

          // Description
          _infoRow(Icons.home_work_outlined, description),
          _infoRow(Icons.build_outlined, 'الفني المسؤول: $supervisor'),
          _infoRow(Icons.location_on_outlined, location),
          _infoRow(Icons.calendar_today_outlined, 'تاريخ البلاغ: $date'),
          _infoRow(Icons.access_time, 'المدة المتوقعة: $duration'),

          const Spacer(),

          // Details Button
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 28,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 13,
                ),
                label: const Text('التفاصيل'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 16),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
