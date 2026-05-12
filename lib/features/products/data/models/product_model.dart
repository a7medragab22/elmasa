class Product {
  final String id;
  final String titleEn;
  final String titleAr;
  final String category;
  final double price;
  final String imageUrl;
  final bool isNew;

  Product({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.isNew = false,
  });
}

final List<Product> mockProducts = [
  Product(
    id: '1',
    titleEn: 'Classic Thobe',
    titleAr: 'ثوب كلاسيكي',
    category: 'Casual Wear',
    price: 299,
    imageUrl: 'assets/images/thobe1.png',
    isNew: true,
  ),
  Product(
    id: '2',
    titleEn: 'Summer Thobe',
    titleAr: 'ثوب صيفي',
    category: 'Casual Wear',
    price: 249,
    imageUrl: 'assets/images/thobe2.png',
    isNew: false,
  ),
  Product(
    id: '3',
    titleEn: 'Cotton Comfort',
    titleAr: 'قطن مريح',
    category: 'Casual Wear',
    price: 199,
    imageUrl: 'assets/images/thobe3.png',
    isNew: false,
  ),
];
