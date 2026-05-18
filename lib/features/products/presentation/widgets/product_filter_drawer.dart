import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class ProductFilterDrawer extends StatefulWidget {
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;
  final int initialRating;
  final VoidCallback onApply;

  const ProductFilterDrawer({
    super.key,
    required this.minPriceController,
    required this.maxPriceController,
    required this.initialRating,
    required this.onApply,
  });

  @override
  State<ProductFilterDrawer> createState() => _ProductFilterDrawerState();
}

class _ProductFilterDrawerState extends State<ProductFilterDrawer> {
  late int selectedRating;

  @override
  void initState() {
    super.initState();
    selectedRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // Explicitly white as requested
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).filters,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).priceRange,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.minPriceController,
                      decoration: InputDecoration(
                        labelText: S.of(context).min,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: TextField(
                      controller: widget.maxPriceController,
                      decoration: InputDecoration(
                        labelText: S.of(context).max,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).rating,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(height: 16.h),
              Column(
                children: List.generate(5, (index) {
                  int rating = 5 - index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedRating = rating;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: rating,
                            groupValue: selectedRating,
                            activeColor: AppColors.primaryYellow,
                            onChanged: (val) {
                              setState(() {
                                selectedRating = val!;
                              });
                            },
                          ),
                          Row(
                            children: List.generate(5, (starIndex) {
                              return Icon(
                                starIndex < rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 20.sp,
                              );
                            }),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            rating == 5 ? S.of(context).only : S.of(context).andUp,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onApply();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryYellow,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    S.of(context).applyFilters,
                    style: TextStyle(
                      color: AppColors.primaryDarkGreen,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
