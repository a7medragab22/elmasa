import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/custom_empty_card.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListenableBuilder(
        listenable: CartManager.instance,
        builder: (context, _) {
          final items = CartManager.instance.items;
          return Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping Cart',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    Text(
                      '${CartManager.instance.totalItems} items',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Items List and Summary
              Expanded(
                child: items.isEmpty
                    ? _buildEmptyState(context)
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 600) {
                            // Tablet Layout
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(20.w),
                                    itemCount: items.length,
                                    itemBuilder: (context, index) =>
                                        _buildCartItem(items[index]),
                                  ),
                                ),
                                Container(
                                  width: 300.w,
                                  margin: EdgeInsets.all(20.w),
                                  child: _buildSummarySection(
                                    context,
                                    isTablet: true,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            // Mobile Layout
                            return ListView(
                              padding: EdgeInsets.all(20.w),
                              children: [
                                ...items.map((item) => _buildCartItem(item)),
                                SizedBox(height: 20.h),
                                _buildSummarySection(context),
                                SizedBox(height: 100.h), // Extra space for bottom nav
                              ],
                            );
                          }
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return CustomEmptyCard(
      icon: Icons.shopping_cart_outlined,
      title: 'Your cart is empty',
      subtitle: 'Add some items to start shopping!',
      buttonText: 'Start Shopping',
      onButtonPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.home,
          (route) => false,
        );
      },
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                Text(
                  'ثوب كلاسيكي',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'SAR ${item.price.toInt()}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        children: [
                          _buildQtyBtn(
                            Icons.remove,
                            () => CartManager.instance.updateQuantity(
                              item.id,
                              -1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildQtyBtn(
                            Icons.add,
                            () =>
                                CartManager.instance.updateQuantity(item.id, 1),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => CartManager.instance.removeItem(item.id),
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
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

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Icon(icon, size: 16.sp, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context, {bool isTablet = false}) {
    final manager = CartManager.instance;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isTablet ? BorderRadius.circular(16.r) : null,
        border: isTablet ? Border.all(color: Colors.grey.shade200) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: isTablet ? const Offset(0, 4) : const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            'Subtotal',
            'SAR ${manager.subtotal.toStringAsFixed(2)}',
          ),
          SizedBox(height: 10.h),
          _buildSummaryRow(
            'VAT (15%)',
            'SAR ${manager.vat.toStringAsFixed(2)}',
          ),
          const Divider(height: 30),
          _buildSummaryRow(
            'Total',
            'SAR ${manager.total.toStringAsFixed(2)}',
            isTotal: true,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.checkout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryYellow,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.primaryGreen : Colors.black,
          ),
        ),
      ],
    );
  }
}
