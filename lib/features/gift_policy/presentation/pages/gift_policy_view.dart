import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/custom_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class GiftPolicyView extends StatelessWidget {
  const GiftPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
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
                        S.of(context).home,
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
                      S.of(context).giftPolicy,
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
                        S.of(context).giftPolicy,
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
                                    S.of(context).winterGiftTerms,
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
                                  S.of(context).giftsWhileStocksLast,
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.replay, // reverse arrow
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  S.of(context).returnGiftWithOrder,
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.local_offer, // tag
                              iconColor: const Color(0xFF3B82F6),
                              text:
                                  S.of(context).winterGiftTier1,
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.local_offer, // tag
                              iconColor: const Color(0xFFEF4444),
                              text: S.of(context).winterGiftTier2,
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
                                    S.of(context).accessoryGiftTerms,
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
                                  S.of(context).giftsWhileStocksLast,
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons.card_giftcard,
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  S.of(context).accessoryGiftTier1,
                            ),
                            SizedBox(height: 16.h),
                            _buildListItem(
                              icon: Icons
                                  .featured_play_list_rounded, // Double gift placeholder
                              iconColor: const Color(0xFFF59E0B),
                              text:
                                  S.of(context).accessoryGiftTier2,
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
