import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class CheckoutSummarySection extends StatelessWidget {
  const CheckoutSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = CartManager.instance;

    return CheckoutSectionCard(
      title: S.of(context).orderSummary,
      children: [
        _buildSummaryRow(S.of(context).subtotal, '${manager.subtotal.toStringAsFixed(2)} ${S.of(context).sar}'),
        SizedBox(height: 12.h),
        _buildSummaryRow(S.of(context).vat, '${manager.vat.toStringAsFixed(2)} ${S.of(context).sar}'),
        SizedBox(height: 12.h),
        _buildSummaryRow(S.of(context).shipping, S.of(context).free, isGreen: true),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).totalAmount,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              '${S.of(context).sar} ${manager.total.toStringAsFixed(2)}',
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
