import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).resetPasswordTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Icon(
                  Icons.security_outlined,
                  size: 100.sp,
                  color: AppColors.primaryYellow,
                ),
                SizedBox(height: 30.h),
                Text(
                  S.of(context).setNewPassword,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).resetPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  hintText: S.of(context).newPassword,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible,
                    ),
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hintText: S.of(context).confirmNewPassword,
                  obscureText: !_isConfirmVisible,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => _isConfirmVisible = !_isConfirmVisible),
                    icon: Icon(
                      _isConfirmVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  buttonName: S.of(context).updatePassword,
                  onPressed: () {
                    // After update, navigate back to login
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteNames.signin,
                      (route) => false,
                    );
                  },
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
