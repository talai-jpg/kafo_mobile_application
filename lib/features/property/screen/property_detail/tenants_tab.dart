import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/property/models/property_model.dart';

class TenantsTab extends StatelessWidget {
  final Property property;

  const TenantsTab({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
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
                'إضافة مستأجر جديد',
                style: TextStyle(
                  color: AppColor.primary_400,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Filters
          Wrap(
            spacing: 8,
            children: [
              _filterChip('الكل', selected: true),
              _filterChip('عقد متأخر بالدفع'),
              _filterChip('نشط'),
              _filterChip('عقود منتهية قريباً'),
            ],
          ),
          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
            children: [
              _tenantCard(
                name: 'أحمد محمد',
                status: 'نشط',
                statusColor: AppColor.primary_400,
                propertyName: 'شقة 12 - الدور الثالث | عمارة النور',
                openReports: 2,
                address: 'الرياض، الشبلية',
                contractEnd: '15/04/2026',
              ),
              _tenantCard(
                name: 'فاطمة علي',
                status: 'عقد منتهي قريباً',
                statusColor: Color(0xffdfb400),
                propertyName: 'فيلا رقم 5 - حي الياسمين',
                openReports: 2,
                address: 'الرياض، الياسمين',
                contractEnd: '15/09/2025',
              ),
              _tenantCard(
                name: 'خالد سعيد',
                status: 'عقد متأخر بالدفع',
                statusColor: Color(0xffd00416),
                propertyName: 'محل رقم 7 - مجمع السلام التجاري',
                openReports: 4,
                address: 'الرياض، السليمانية',
                contractEnd: '01/10/2024',
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  Widget _tenantCard({
    required String name,
    required String status,
    required Color statusColor,
    required String propertyName,
    required int openReports,
    required String address,
    required String contractEnd,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
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
                color: statusColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Tenant name
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),

          // Property
          _infoRow(Icons.home_work_outlined, propertyName),
          _infoRow(Icons.build_outlined, 'البلاغات المفتوحة: $openReports'),
          _infoRow(Icons.location_on_outlined, address),
          _infoRow(Icons.calendar_today_outlined, 'العقد ينتهي: $contractEnd'),

          const Spacer(),

          // Details button
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 28,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_sharp, size: 13),
                label: const Text('التفاصيل'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 15),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
