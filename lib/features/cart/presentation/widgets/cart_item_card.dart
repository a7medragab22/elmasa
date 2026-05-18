import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
            onTap: () {
              final product = mockProducts.firstWhere(
                (p) => p.id == item.id,
                orElse: () => mockProducts.first,
              );
              Navigator.pushNamed(
                context,
                AppRouteNames.productDetails,
                arguments: product,
              );
            },
            child: Container(
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
                  S.of(context).premiumCollection,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${S.of(context).sar} ${item.price.toInt()}',
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
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGreen.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          _buildQtyBtn(
                            Icons.remove,
                            () => CartManager.instance.updateQuantity(item.id, -1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          _buildQtyBtn(
                            Icons.add,
                            () => CartManager.instance.updateQuantity(item.id, 1),
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
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Icon(icon, size: 16.sp, color: Colors.white),
      ),
    );
  }
}
