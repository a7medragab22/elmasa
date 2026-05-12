import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:elmasa/features/products/presentation/widgets/product_filter_drawer.dart';
import 'package:elmasa/features/products/presentation/widgets/product_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:elmasa/core/utils/widgets/custom_empty_card.dart';

class ProductsView extends StatefulWidget {
  final String? tag;
  const ProductsView({super.key, this.tag});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String selectedSort = 'Newest First';
  List<Product> products = mockProducts;
  List<Product> filteredProducts = mockProducts;

  final TextEditingController _minPriceController = TextEditingController(
    text: '0',
  );
  final TextEditingController _maxPriceController = TextEditingController(
    text: '1000',
  );
  int selectedRating = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      double min = double.tryParse(_minPriceController.text) ?? 0;
      double max = double.tryParse(_maxPriceController.text) ?? 10000;
      filteredProducts = mockProducts.where((p) {
        bool matchesPrice = p.price >= min && p.price <= max;
        return matchesPrice;
      }).toList();

      if (selectedSort == 'Price: Low to High') {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (selectedSort == 'Price: High to Low') {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: ProductFilterDrawer(
        minPriceController: _minPriceController,
        maxPriceController: _maxPriceController,
        initialRating: selectedRating,
        onApply: _applyFilters,
      ),
      body: SafeArea(
        child: filteredProducts.isEmpty
            ? CustomEmptyCard(
                icon: Icons.inventory_2_outlined,
                title: "No products found",
                subtitle: "Try adjusting your filters or check back later",
                buttonText: "Back to Home",
                onButtonPressed: () => Navigator.pop(context),
              )
            : SafeArea(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header: Title and Filter Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.tag ?? 'Casual Wear',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () =>
                                    _scaffoldKey.currentState?.openEndDrawer(),
                                icon: const Icon(
                                  Icons.tune,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                label: const Text(
                                  'Filter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),

                          // Sort by Row
                          Row(
                            children: [
                              Text(
                                'Sort by:',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: Colors.grey.shade200),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedSort,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.primaryGreen,
                                      size: 20.sp,
                                    ),
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primaryGreen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    items: [
                                      'Newest First',
                                      'Price: Low to High',
                                      'Price: High to Low'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedSort = newValue!;
                                        _applyFilters();
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),

                          // Product Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.h,
                                ),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              return ProductItemCard(
                                product: filteredProducts[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const AppFooter(),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        foregroundColor: Colors.white,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.chat_bubble_outline),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
