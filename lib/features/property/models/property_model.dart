class Property {
  final int id;
  final String name;
  final String type; // مثل "شقة", "فيلا"
  final String location;
  final String imageUrl;
  final String status; // مثل "صيانة", "مؤجر"
  final String revenue;
  final int units;
  final int occupiedUnits;

  Property({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.imageUrl,
    required this.status,
    required this.revenue,
    required this.units,
    required this.occupiedUnits,
  });

  double get occupancyRate => (occupiedUnits / units * 100).toDouble();
}
