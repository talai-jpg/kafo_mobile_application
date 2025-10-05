import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/property/models/property_model.dart';
import 'package:kafo_app/features/property/screen/property_detail/detail_header.dart';
import 'package:kafo_app/features/property/screen/property_detail/maintenance_tab.dart';
import 'package:kafo_app/features/property/screen/property_detail/tenants_tab.dart';
import 'units_tab.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              property.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 210,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    DetailHeader(property: property),

                    const TabBar(
                      labelColor: AppColor.primary_400,
                      unselectedLabelColor: Colors.black54,
                      indicatorColor: AppColor.primary_400,
                      tabs: [
                        Tab(text: 'الوحدات'),
                        Tab(text: 'المستأجرين'),
                        Tab(text: 'الصيانة'),
                      ],
                    ),

                    // Tab Content
                    Expanded(
                      child: TabBarView(
                        children: [
                          UnitsTab(property: property),
                          TenantsTab(property: property),
                          MaintenanceTab(property: property),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
