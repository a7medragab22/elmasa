import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/custom_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class SadVipPointsView extends StatelessWidget {
  const SadVipPointsView({super.key});

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
                      S.of(context).sadVipPoints,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                // Main Info Card
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 40.h,
                        horizontal: 24.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
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
                          Text(
                            S.of(context).sadVipPointsTitle,
                            style: TextStyle(
                              color: const Color(0xFF1E293B),
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            S.of(context).collectPointsDesc,
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 16.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            S.of(context).earn1PointDesc,
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 16.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            S.of(context).pointsToDiscountDesc,
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 16.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF6E4E32,
                                ), // Brown color
                                padding: EdgeInsets.symmetric(
                                  horizontal: 48.w,
                                  vertical: 16.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Text(
                                S.of(context).receivePoints,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Floating Star
                    Positioned(
                      right: -20.w,
                      bottom: 40.h,
                      child: Icon(
                        Icons.star,
                        color: const Color(0xFFFFD700),
                        size: 120.sp,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),

                // Ways to Earn Points Section
                Center(
                  child: Text(
                    S.of(context).waysToEarnPoints,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                _buildEarnPointCard(
                  points: S.of(context).onePoint,
                  title: S.of(context).shopNow,
                  buttonText: S.of(context).orderFromStore,
                ),
                SizedBox(height: 16.h),
                _buildEarnPointCard(
                  points: S.of(context).hundredPoints,
                  title: S.of(context).rateYourOrder,
                  buttonText: S.of(context).rateOrderBtn,
                ),
                SizedBox(height: 16.h),
                _buildInviteCard(context),
                SizedBox(height: 48.h),

                // Discounts Section
                Center(
                  child: Text(
                    S.of(context).discounts,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                _buildDiscountCard(context, points: S.of(context).thousandPoints, discount: S.of(context).hundredSar),
                SizedBox(height: 16.h),
                _buildDiscountCard(context, points: S.of(context).fiveHundredPoints, discount: S.of(context).fiftySar),
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

  Widget _buildEarnPointCard({
    required String points,
    required String title,
    required String buttonText,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    points,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3EFEA), // Light brown background
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  color: const Color(0xFF6E4E32), // Brown color
                  size: 32.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              side: const BorderSide(color: Color(0xFFCBD5E1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: const Color(0xFF1E293B),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).twentyFivePoints,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    S.of(context).inviteFriends,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3EFEA),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  color: const Color(0xFF6E4E32),
                  size: 32.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    'https://elmasa.com/...',
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: const Color(0xFF6E4E32),
                    size: 20.sp,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCard(
    BuildContext context, {
    required String points,
    required String discount,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          Text(
            S.of(context).saadBrandAr,
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            S.of(context).saadBrandEn,
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            S.of(context).discountCouponStr(discount),
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).discountCodeStr(discount.split(' ')[0]),
            style: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
          ),
          SizedBox(height: 24.h),
          Text(
            points,
            style: TextStyle(
              color: const Color(0xFF6E4E32),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
