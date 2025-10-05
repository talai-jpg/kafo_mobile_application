class Property {
  final String name;
  final String status;
  final String imagePath;

  Property({required this.name, required this.status, required this.imagePath});
}

List<Property> dummyProperties = [
  Property(
    name: 'عمارة النرجس',
    status: '%75 من الشقق محجوزة',
    imagePath: 'assets/images/ha.png',
  ),
  Property(
    name: 'عمارة النقل',
    status: '%45 من الشقق محجوزة',
    imagePath: 'assets/images/ha.png',
  ),
];
