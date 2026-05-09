import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/footer_widget.dart';
import '../../../../core/widgets/main_app_bar.dart';
import '../../../../core/widgets/main_bottom_nav_bar.dart';

class ProductsView extends StatefulWidget {
  final String? tag;
  const ProductsView({super.key, this.tag});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String selectedSort = 'Our Suggestions';
  int selectedRating = 0;
  String selectedPrice = '';
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  Map<String, String> selectedSizes = {};

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const MainAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "The first destination for all women's details",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      'SORT:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSort,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            items:
                                [
                                  'Our Suggestions',
                                  'Price: Low to High',
                                  'Price: High to Low',
                                  'Newest',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedSort = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _buildFilterCard(),
                SizedBox(height: 24.h),
                if (widget.tag == null || widget.tag == 'Casual') ...[
                  _buildProductCard(
                    'abaya_1',
                    'ABAYAS',
                    'Black Embroidered Abaya',
                    350.0,
                  ),
                  SizedBox(height: 16.h),
                ],
                if (widget.tag == null || widget.tag == 'Evening') ...[
                  _buildProductCard(
                    'dress_1',
                    'CLOTHES',
                    'Evening Dress',
                    500.0,
                  ),
                ],
              ],
            ),
          ),
          const AppFooter(),
          SizedBox(height: 80.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }

  Widget _buildFilterCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.r),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8.r),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Rating',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          _buildRatingRadio(5),
          _buildRatingRadio(4, '& Up'),
          _buildRatingRadio(3, '& Up'),
          SizedBox(height: 24.h),
          Text(
            'Price',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          _buildPriceRadio('200 - 300 SAR'),
          _buildPriceRadio('300 - 400 SAR'),
          _buildPriceRadio('More than 400 SAR'),
          SizedBox(height: 16.h),
          Text(
            'Custom Range:',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _minPriceController,
                  decoration: InputDecoration(
                    hintText: 'From',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  controller: _maxPriceController,
                  decoration: InputDecoration(
                    hintText: 'To',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              child: Text('Filter', style: TextStyle(fontSize: 16.sp)),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  selectedRating = 0;
                  selectedPrice = '';
                  _minPriceController.clear();
                  _maxPriceController.clear();
                });
              },
              icon: const Icon(Icons.close, color: Colors.red),
              label: Text(
                'Clear Filters',
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRadio(int stars, [String suffix = '']) {
    return Row(
      children: [
        Radio<int>(
          value: stars,
          groupValue: selectedRating,
          onChanged: (val) {
            setState(() {
              selectedRating = val!;
            });
          },
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < stars ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20.sp,
            );
          }),
        ),
        if (suffix.isNotEmpty) ...[
          SizedBox(width: 8.w),
          Text(
            suffix,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
          ),
        ],
      ],
    );
  }

  Widget _buildPriceRadio(String title) {
    return Row(
      children: [
        Radio<String>(
          value: title,
          groupValue: selectedPrice,
          onChanged: (val) {
            setState(() {
              selectedPrice = val!;
              if (val == '200 - 300 SAR') {
                _minPriceController.text = '200';
                _maxPriceController.text = '300';
              } else if (val == '300 - 400 SAR') {
                _minPriceController.text = '300';
                _maxPriceController.text = '400';
              } else if (val == 'More than 400 SAR') {
                _minPriceController.text = '400';
                _maxPriceController.text = '';
              }
            });
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade800),
        ),
      ],
    );
  }

  Widget _buildProductCard(
    String id,
    String category,
    String title,
    double price,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Area
          Container(
            height: 350.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 50.sp,
                    color: Colors.grey.shade300,
                  ),
                ),
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Details Area
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      price.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'SAR',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSizes[id],
                            hint: Text(
                              'Select Size',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey.shade700,
                            ),
                            items: ['S', 'M', 'L', 'XL'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedSizes[id] = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    InkWell(
                      onTap: () {
                        CartManager.instance.addItem(
                          CartItem(
                            id: id,
                            title: title,
                            price: price,
                            imageUrl: '',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Item added to cart!'),
                            backgroundColor: Colors.green.shade600,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, {Color color = Colors.black87}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Icon(icon, color: color, size: 20.sp),
    );
  }
}
