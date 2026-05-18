import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class CheckoutBottomBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CheckoutBottomBar({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final total = CartManager.instance.total;

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  CartManager.instance.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).orderPlacedSuccessfully)),
                  );
                  Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.home, (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDarkGreen,
                padding: EdgeInsets.symmetric(vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
              child: Text(
                '${S.of(context).placeOrder} - ${S.of(context).sar} ${total.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: const Color(0xFF25D366),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
