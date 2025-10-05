import 'package:flutter/material.dart';
import 'package:kafo_app/features/home/controller/propety.dart';
import 'package:kafo_app/features/home/widgets/property_card.dart';

class PropertiesSection extends StatelessWidget {
  PropertiesSection({super.key});

  final List<Property> propertiesList = dummyProperties;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: false,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: propertiesList.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: propertiesList[index]);
        },
      ),
    );
  }
}
