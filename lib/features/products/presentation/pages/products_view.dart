import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:elmasa/features/products/presentation/widgets/product_filter_drawer.dart';
import 'package:elmasa/features/products/presentation/widgets/product_item_card.dart';
import 'package:elmasa/features/products/presentation/widgets/products_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:elmasa/core/utils/widgets/custom_empty_card.dart';
import 'package:elmasa/generated/l10n.dart';

class ProductsView extends StatefulWidget {
  final String? tag;
  const ProductsView({super.key, this.tag});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String selectedSort = 'Newest First';
  List<Product> filteredProducts = mockProducts;

  final TextEditingController _minPriceController = TextEditingController(text: '0');
  final TextEditingController _maxPriceController = TextEditingController(text: '1000');
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
      backgroundColor: Colors.white,
      endDrawer: ProductFilterDrawer(
        minPriceController: _minPriceController,
        maxPriceController: _maxPriceController,
        initialRating: selectedRating,
        onApply: _applyFilters,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProductsHeader(
              title: widget.tag ?? S.of(context).productsTitle,
              selectedSort: selectedSort,
              onFilterTap: () => _scaffoldKey.currentState?.openEndDrawer(),
              onSortChanged: (newValue) {
                setState(() {
                  selectedSort = newValue!;
                  _applyFilters();
                });
              },
            ),
            Expanded(
              child: filteredProducts.isEmpty
                  ? Center(
                      child: CustomEmptyCard(
                        icon: Icons.inventory_2_outlined,
                        title: S.of(context).noProductsFound,
                        subtitle: S.of(context).tryAdjustingFilters,
                        buttonText: S.of(context).resetFilters,
                        onButtonPressed: () {
                          setState(() {
                            _minPriceController.text = '0';
                            _maxPriceController.text = '1000';
                            _applyFilters();
                          });
                        },
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),
                        const AppFooter(),
                        SizedBox(height: 80.h),
                      ],
                    ),
            ),
          ],
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
