import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class CheckoutTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isRequired;
  final TextInputType keyboardType;
  final int maxLines;

  const CheckoutTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isRequired = true,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF475569),
              ),
              children: [
                if (isRequired)
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
              ],
            ),
          ),
        ),
        TextFormField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: TextStyle(fontSize: 15.sp, color: const Color(0xFF1E293B)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primaryGreen, width: 1.5),
            ),
          ),
          validator: (value) {
            if (isRequired) {
              if (value == null || value.isEmpty) return S.of(context).thisFieldIsRequired;
            }
            return null;
          },
        ),
      ],
    );
  }
}
