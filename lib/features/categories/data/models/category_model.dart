class Category {
  final String id;
  final String titleEn;
  final String titleAr;
  final String imageUrl;
  final List<String> tags;
  final int itemCount;
  final bool isAsset;

  Category({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.imageUrl,
    this.tags = const [],
    required this.itemCount,
    this.isAsset = false,
  });
}

final List<Category> appCategories = [
  Category(
    id: '1',
    titleEn: 'Abayas',
    titleAr: 'عبايات',
    imageUrl: 'assets/abayaa.jpg',
    tags: ['Casual', 'Evening', 'Umrah'],
    itemCount: 45,
    isAsset: true,
  ),
  Category(
    id: '2',
    titleEn: 'Fabrics',
    titleAr: 'أقمشة',
    imageUrl: 'assets/clothes.jpg',
    tags: ['Cotton', 'Silk', 'Wool'],
    itemCount: 32,
    isAsset: true,
  ),
  Category(
    id: '3',
    titleEn: 'Clothes',
    titleAr: 'ملابس',
    imageUrl: 'assets/fabrics-bg.jpg',
    tags: ['Men', 'Women', 'Kids'],
    itemCount: 85,
    isAsset: true,
  ),
  Category(
    id: '4',
    titleEn: 'Leather',
    titleAr: 'جلديات',
    imageUrl: 'assets/lather-bg.jpg',
    tags: ['Bags', 'Wallets', 'Accessories'],
    itemCount: 28,
    isAsset: true,
  ),
  Category(
    id: '5',
    titleEn: 'Giveaways',
    titleAr: 'هدايا',
    imageUrl: 'assets/giveaways.jpg',
    tags: ['Active', 'Past', 'Upcoming'],
    itemCount: 15,
    isAsset: true,
  ),
];
