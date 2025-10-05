import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/property/models/property_model.dart';

class UnitsTab extends StatelessWidget {
  final Property property;

  const UnitsTab({super.key, required this.property});

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
                'إضافة وحدة جديدة',
                style: TextStyle(
                  color: AppColor.primary_400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            children: [
              _filterChip('الكل', selected: true),
              _filterChip('مؤجر'),
              _filterChip('متاح'),
              _filterChip('صيانة'),
            ],
          ),
          const SizedBox(height: 20),

          _unitCard(
            title: 'شقة 12 - الدور الثالث',
            status: 'مؤجر',
            contracts: 0,
            maintenance: 0,
            area: '120 م²',
            location: 'الرياض، حي النور',
            rent: '5,000 ر.س',
          ),
          const SizedBox(height: 12),
          _unitCard(
            title: 'شقة 2 - الدور الأول',
            status: 'متاح',
            contracts: 1,
            maintenance: 2,
            area: '120 م²',
            location: 'الرياض، حي النور',
            rent: '3,000 ر.س',
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
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }

  Widget _unitCard({
    required String title,
    required String status,
    required int contracts,
    required int maintenance,
    required String area,
    required String location,
    required String rent,
  }) {
    final Color statusColor = status == 'صيانة'
        ? Colors.red
        : status == 'متاح'
        ? Colors.grey
        : AppColor.primary_400;

    return Container(
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
      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/pimage1.png',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.apartment,
                            size: 12,
                            color: AppColor.primary_400,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'شقة',
                            style: TextStyle(
                              color: AppColor.primary_400,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Contracts
                  Row(
                    children: [
                      const Icon(
                        Icons.assignment_outlined,
                        size: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'العقود المنتهية: $contracts',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // Maintenance
                  Row(
                    children: [
                      const Icon(
                        Icons.build_outlined,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'البلاغات المفتوحة: $maintenance',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColor.primary_400,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.square_foot_outlined,
                        size: 16,
                        color: AppColor.primary_400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        area,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'الإيرادات الشهرية:',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rent,
                            style: const TextStyle(
                              color: AppColor.primary_400,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff429c75),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 7,
                        ),

                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'التفاصيل',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 12,
                              color: AppColor.primary_400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
