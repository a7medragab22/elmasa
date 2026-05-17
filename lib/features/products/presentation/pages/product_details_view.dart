import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:elmasa/features/products/presentation/widgets/product_details_info.dart';
import 'package:elmasa/features/products/presentation/widgets/product_details_tabs.dart';
import 'package:elmasa/features/products/presentation/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    final cartItem = CartManager.instance.items.firstWhere(
      (item) => item.id == widget.product.id,
      orElse: () => CartItem(id: '', title: '', price: 0, imageUrl: ''),
    );
    if (cartItem.id.isNotEmpty) {
      quantity = cartItem.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(images: widget.product.images),
            ProductDetailsInfo(product: widget.product),
            PaymentOptionsCard(price: widget.product.price),
            SizedBox(height: 24.h),
            _buildQuantitySelector(),
            SizedBox(height: 24.h),
            ProductTabsSection(details: widget.product.details),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final exists = CartManager.instance.items.any((item) => item.id == widget.product.id);
                  if (exists) {
                    CartManager.instance.setItemQuantity(widget.product.id, quantity);
                  } else {
                    CartManager.instance.addItem(
                      CartItem(
                        id: widget.product.id,
                        title: widget.product.titleEn,
                        price: widget.product.price,
                        imageUrl: widget.product.imageUrl,
                        quantity: quantity,
                      ),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cart updated')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryGreen,
                  side: const BorderSide(color: AppColors.primaryGreen),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final exists = CartManager.instance.items.any((item) => item.id == widget.product.id);
                  if (exists) {
                    CartManager.instance.setItemQuantity(widget.product.id, quantity);
                  } else {
                    CartManager.instance.addItem(
                      CartItem(
                        id: widget.product.id,
                        title: widget.product.titleEn,
                        price: widget.product.price,
                        imageUrl: widget.product.imageUrl,
                        quantity: quantity,
                      ),
                    );
                  }
                  Navigator.pushNamed(context, AppRouteNames.checkout);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryYellow,
                  foregroundColor: AppColors.primaryDarkGreen,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Text(
            'Quantity',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _buildQtyBtn(Icons.remove, () {
                  if (quantity > 1) setState(() => quantity--);
                }),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ),
                _buildQtyBtn(Icons.add, () {
                  setState(() => quantity++);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 20.sp, color: AppColors.primaryGreen),
    );
  }
}
