import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).forgotPasswordTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Icon(
                  Icons.lock_reset_outlined,
                  size: 100.sp,
                  color: AppColors.primaryYellow,
                ),
                SizedBox(height: 30.h),
                Text(
                  S.of(context).forgotPasswordQuestion,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).forgotPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  hintText: S.of(context).emailAddress,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  buttonName: S.of(context).sendLink,
                  onPressed: () {
                    // Navigate to Verification
                    Navigator.pushNamed(context, AppRouteNames.verification);
                  },
                ),
                SizedBox(height: 40.h), // Replaced Spacer with fixed gap
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    S.of(context).backToLogin,
                    style: TextStyle(color: AppColors.primaryYellow),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
