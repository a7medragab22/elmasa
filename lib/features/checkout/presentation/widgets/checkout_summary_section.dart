import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutSummarySection extends StatelessWidget {
  const CheckoutSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = CartManager.instance;

    return CheckoutSectionCard(
      title: 'Order Summary',
      children: [
        _buildSummaryRow('Subtotal', '${manager.subtotal.toStringAsFixed(2)} SAR'),
        SizedBox(height: 12.h),
        _buildSummaryRow('VAT (15%)', '${manager.vat.toStringAsFixed(2)} SAR'),
        SizedBox(height: 12.h),
        _buildSummaryRow('Shipping', 'FREE', isGreen: true),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              'SAR ${manager.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isGreen = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: isGreen ? Colors.green : const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
