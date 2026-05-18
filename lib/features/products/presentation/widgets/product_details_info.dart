import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:elmasa/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsInfo extends StatelessWidget {
  final Product product;
  const ProductDetailsInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.titleEn,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      product.titleAr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: product.isAvailable
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      product.isAvailable ? Icons.check_circle : Icons.error,
                      color: product.isAvailable ? Colors.green : Colors.red,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      product.isAvailable
                          ? S.of(context).available
                          : S.of(context).unavailable,
                      style: TextStyle(
                        color: product.isAvailable ? Colors.green : Colors.red,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${product.price.toInt()} ${S.of(context).sar}',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h, left: 8.w, right: 8.w),
                child: Text(
                  S.of(context).includingVat,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            Localizations.localeOf(context).languageCode == 'ar'
                ? product.descriptionAr
                : product.descriptionEn,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            S.of(context).productNumber,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              product.productNumber,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
