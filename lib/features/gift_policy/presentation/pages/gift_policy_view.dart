import 'package:elmasa/core/utils/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftPolicyView extends StatelessWidget {
  const GiftPolicyView({super.key});

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
                      'Gift Policy',
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
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 40.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: const Border(
                      top: BorderSide(color: Color(0xFFDC2626), width: 4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24.w),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEE2E2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.card_giftcard,
                          color: const Color(0xFFDC2626),
                          size: 64.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Gift Policy',
                        style: TextStyle(
                          color: const Color(0xFF4A3B2C),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 48.h),

                      // Winter Gift Offer Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.ac_unit, // Snowflake icon placeholder
                                  color: const Color(0xFF3B82F6),
                                  size: 28.sp,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    'Terms and conditions for the winter gift offer:',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3B2C),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            _buildListItem(
                              icon: Icons.check_circle,
                              iconColor: const Color(0xFF10B981),
                              text:
                                  'Gifts are granted to all orders while stocks last.',
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.replay, // reverse arrow
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  'In case of order return, the included gift must be returned to complete the refund.',
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.local_offer, // tag
                              iconColor: const Color(0xFF3B82F6),
                              text:
                                  'Orders up to 199 SAR: One free winter blouse.',
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.local_offer, // tag
                              iconColor: const Color(0xFFEF4444),
                              text: 'Orders over 599 SAR: Two winter gifts.',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Accessory Gift Offer Section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFFF7ED,
                          ), // light orange background
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.diamond, // Accessory icon placeholder
                                  color: const Color(0xFFF59E0B),
                                  size: 28.sp,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    'Terms and conditions for the accessory gift offer:',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3B2C),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            _buildListItem(
                              icon: Icons.check_circle,
                              iconColor: const Color(0xFF10B981),
                              text:
                                  'Gifts are granted to all orders while stocks last.',
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.card_giftcard,
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  'Orders up to 599 SAR: One free piece from Saad.',
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons
                                  .featured_play_list_rounded, // Double gift placeholder
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  'Orders of 600 SAR and more: One free piece from Saad + Gift Accessory.',
                            ),
                          ],
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

  Widget _buildListItem({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 24.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF475569),
              fontSize: 16.sp,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
