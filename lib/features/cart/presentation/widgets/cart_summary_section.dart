import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSummarySection extends StatelessWidget {
  final bool isTablet;

  const CartSummarySection({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.checkout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryYellow,
                padding: EdgeInsets.symmetric(vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
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
