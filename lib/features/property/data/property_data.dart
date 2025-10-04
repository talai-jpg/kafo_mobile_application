import '../models/property_model.dart';

final List<Property> properties = [
  Property(
    id: 1,
    name: 'عمارة النور',
    type: 'عمارة',
    location: 'الرياض - حي النور',
    imageUrl: 'assets/images/pimage1.png',
    status: 'صيانة',
    revenue: '80 ألف',
    units: 12,
    occupiedUnits: 8,
  ),
  Property(
    id: 2,
    name: 'عمارة المزن',
    type: 'عمارة',
    location: 'جدة - حي المرجان',
    imageUrl: 'assets/images/pimage2.jpg',
    status: 'مؤجر',
    revenue: '120 ألف',
    units: 10,
    occupiedUnits: 9,
  ),
];
