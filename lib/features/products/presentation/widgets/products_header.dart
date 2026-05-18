import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class ProductsHeader extends StatelessWidget {
  final String title;
  final VoidCallback onFilterTap;
  final String selectedSort;
  final Function(String?) onSortChanged;

  const ProductsHeader({
    super.key,
    required this.title,
    required this.onFilterTap,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              ElevatedButton.icon(
                onPressed: onFilterTap,
                icon: const Icon(Icons.tune, color: Colors.white, size: 18),
                label: Text(
                  S.of(context).filter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                S.of(context).sortBy,
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
                    items: ['Newest First', 'Price: Low to High', 'Price: High to Low']
                        .map((String value) {
                      String localizedValue = value;
                      if (value == 'Newest First') localizedValue = S.of(context).newestFirst;
                      if (value == 'Price: Low to High') localizedValue = S.of(context).priceLowToHigh;
                      if (value == 'Price: High to Low') localizedValue = S.of(context).priceHighToLow;
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(localizedValue),
                      );
                    }).toList(),
                    onChanged: onSortChanged,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade200, height: 1),
        ],
      ),
    );
  }
}
