import 'package:elmasa/core/utils/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SadVipPointsView extends StatelessWidget {
  const SadVipPointsView({super.key});

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
                      'Sad VIP Points',
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
                            'Sad VIP\nPoints',
                            style: TextStyle(
                              color: const Color(0xFF1E293B),
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Collect points with every order and redeem them as a discount on your next purchases easily — shop starting from 1 SAR',
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 16.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'You earn 1 point. To benefit from rewards and discounts, you must have 500 points or more in your account',
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: 16.sp,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            '500 points = 50 SAR discount, 1000 points = 100 SAR discount',
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
                                'Receive Points',
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
                    'Ways to Earn Points',
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                _buildEarnPointCard(
                  points: '1 Point',
                  title: 'Shop Now',
                  buttonText: 'Order from Store',
                ),
                SizedBox(height: 16.h),
                _buildEarnPointCard(
                  points: '100 Points',
                  title: 'Rate Your Order',
                  buttonText: 'Rate Order',
                ),
                SizedBox(height: 16.h),
                _buildInviteCard(),
                SizedBox(height: 48.h),

                // Discounts Section
                Center(
                  child: Text(
                    'Discounts',
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                _buildDiscountCard(points: '1000 Points', discount: '100 SAR'),
                SizedBox(height: 16.h),
                _buildDiscountCard(points: '500 Points', discount: '50 SAR'),
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

  Widget _buildInviteCard() {
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
                    '25 Points',
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Invite Your Friends',
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

  Widget _buildDiscountCard({
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
            'صاد',
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'SAAD',
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            '$discount Discount Coupon',
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'SAR${discount.split(' ')[0]} Discount Code',
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
