import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/utils/favourites_manager.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemList extends StatelessWidget {
  final Product product;

  const WishlistItemList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
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
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(product.imageUrl.isNotEmpty ? product.imageUrl : 'assets/images/placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.titleEn,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                Text(
                  'SAR ${product.price.toInt()}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryYellow,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => FavouritesManager.instance.removeItem(product.id),
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
              IconButton(
                onPressed: () {
                  CartManager.instance.addItem(
                    CartItem(
                      id: product.id,
                      title: product.titleEn,
                      price: product.price,
                      imageUrl: product.imageUrl,
                    ),
                  );
                },
                icon: Icon(Icons.add_shopping_cart, color: AppColors.primaryGreen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
