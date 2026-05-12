import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/utils/favourites_manager.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemCard extends StatelessWidget {
  final Product product;

  const WishlistItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl.isNotEmpty ? product.imageUrl : 'assets/images/placeholder.png'),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) => const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.titleEn,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'SAR ${product.price.toInt()}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryYellow,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    ListenableBuilder(
                      listenable: CartManager.instance,
                      builder: (context, _) {
                        final cartItem = CartManager.instance.items.firstWhere(
                          (item) => item.id == product.id,
                          orElse: () => CartItem(id: '', title: '', price: 0, imageUrl: ''),
                        );
                        final isInCart = cartItem.id.isNotEmpty;

                        if (isInCart) {
                          return Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCartActionBtn(
                                  icon: Icons.remove,
                                  onTap: () => CartManager.instance.updateQuantity(product.id, -1),
                                ),
                                Text(
                                  '${cartItem.quantity}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                _buildCartActionBtn(
                                  icon: Icons.add,
                                  onTap: () => CartManager.instance.updateQuantity(product.id, 1),
                                ),
                              ],
                            ),
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryGreen,
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_shopping_cart, color: Colors.white, size: 16.sp),
                                SizedBox(width: 8.w),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Remove Button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => FavouritesManager.instance.removeItem(product.id),
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, size: 16.sp, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartActionBtn({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Icon(icon, color: Colors.white, size: 20.sp),
        ),
      ),
    );
  }
}
