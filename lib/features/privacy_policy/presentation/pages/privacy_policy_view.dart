import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const MainAppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade600,
                      size: 20.sp,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                // Main Content Card
                Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: const Color(0xFFD4A373),
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'At Saad, we respect your privacy and your right to choose how your information is used. One of our top priorities is protecting the information we hold.',
                        style: TextStyle(
                          color: const Color(0xFFD4A373),
                          fontSize: 16.sp,
                          height: 1.8,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'We do not share customer information (including email addresses) with any third party unless necessary to provide the products and services we offer. We will only disclose information when we have the right to do so.',
                        style: TextStyle(
                          color: const Color(0xFFD4A373),
                          fontSize: 16.sp,
                          height: 1.8,
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Payment Security Box
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1E7DD),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.security,
                              color: const Color(0xFF003829),
                              size: 32.sp,
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                'Payment Security: We do not store any details of your credit card.',
                                style: TextStyle(
                                  color: const Color(0xFF003829),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      Text(
                        "If you have any questions or concerns about Saad's access to or use of your personal information, please contact us via email or at phone number 920010063.",
                        style: TextStyle(
                          color: const Color(0xFFD4A373),
                          fontSize: 16.sp,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48.h),
              ],
            ),
          ),
          // Footer
          const AppFooter(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
