import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/property/widgets/alerts_board.dart';
import '../data/property_data.dart';
import '../widgets/stat_card.dart';
import '../widgets/property_card.dart';
import 'property_detail_screen.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'الممتلكات',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'البحث',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 6),

            const AlertsBoard(),

            const Text(
              'مؤشرات رئيسية',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatCard(title: 'إجمالي العقارات', value: '12'),
                StatCard(title: 'نسبة الإشغال', value: '33%'),
                StatCard(title: 'الوحدات المتاحة', value: '12'),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'عقاراتك',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'الكل',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.primary_400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            GridView.builder(
              itemCount: properties.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final property = properties[index];
                return PropertyCard(
                  property: property,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PropertyDetailScreen(property: property),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
