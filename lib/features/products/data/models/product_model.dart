class Product {
  final String id;
  final String titleEn;
  final String titleAr;
  final String category;
  final double price;
  final String imageUrl;
  final String descriptionEn;
  final String descriptionAr;
  final String productNumber;
  final bool isAvailable;
  final List<String> images;
  final Map<String, String> details;
  final bool isNew;

  Product({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.productNumber,
    this.isAvailable = true,
    this.images = const [],
    this.details = const {},
    this.isNew = false,
  });
}


final List<Product> mockProducts = [
  Product(
    id: '1',
    titleEn: 'Black Embroidered Abaya',
    titleAr: 'عباية سوداء مطرزة',
    category: 'Abayas',
    price: 350,
    imageUrl: 'assets/images/placeholder.png',
    descriptionEn: 'Luxury black abaya crafted with premium fabric and elegant embroidery. Perfect for special occasions and daily wear.',
    descriptionAr: 'عباية سوداء فاخرة مصنوعة من قماش بريميوم وتطريز أنيق. مثالية للمناسبات الخاصة والارتداء اليومي.',
    productNumber: 'ALF-000001',
    isAvailable: true,
    images: ['assets/images/placeholder.png', 'assets/images/placeholder.png'],
    details: {
      'Material': 'Premium Cotton Blend',
      'Color': 'Black with Gold Embroidery',
      'Size': 'One Size (Adjustable)',
      'Care': 'Hand Wash Only',
      'Origin': 'Made in Saudi Arabia',
    },
    isNew: true,
  ),
  Product(
    id: '2',
    titleEn: 'Summer Thobe',
    titleAr: 'ثوب صيفي',
    category: 'Fabrics',
    price: 249,
    imageUrl: 'assets/images/placeholder.png',
    descriptionEn: 'Lightweight summer thobe designed for maximum comfort in hot weather.',
    descriptionAr: 'ثوب صيفي خفيف الوزن مصمم لتوفير أقصى درجات الراحة في الطقس الحار.',
    productNumber: 'ALF-000002',
    images: ['assets/images/placeholder.png'],
    isNew: false,
  ),
];
