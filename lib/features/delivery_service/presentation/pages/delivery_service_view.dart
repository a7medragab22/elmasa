import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/core/widgets/main_app_bar.dart';
import 'package:elmasa/core/widgets/footer_widget.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/widgets/main_bottom_nav_bar.dart';

class DeliveryServiceView extends StatelessWidget {
  const DeliveryServiceView({super.key});

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
                      'Delivery Service',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                // Main Icon and Title
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          size: 64.sp,
                          color: const Color(0xFF1E6CFF),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Delivery Service',
                        style: TextStyle(
                          color: const Color(0xFF1E293B),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),

                // Info Box
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: const Color(0xFF1E6CFF),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E6CFF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          "If the customer's address is outside the shipping company's delivery area, the shipment will be directed to the nearest branch of the company in the customer's area, where the customer can collect the shipment directly from the designated office.",
                          style: TextStyle(
                            color: const Color(0xFF475569),
                            fontSize: 16.sp,
                            height: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // Local Delivery Box
                _buildDeliveryCard(
                  topColor: const Color(0xFF10B981),
                  icon: Icons.inventory_2,
                  iconColor: const Color(0xFF10B981),
                  title: 'Delivery duration within\nKingdom cities',
                  titleColor: const Color(0xFFD4A373),
                  details: [
                    _DeliveryDetail(
                      icon: Icons.access_time,
                      text: 'From 4 to 7 working days',
                      iconColor: const Color(0xFF10B981),
                    ),
                    _DeliveryDetail(
                      icon: Icons.business,
                      text: 'Shipping Companies: Aramex -\nSMSA',
                      iconColor: const Color(0xFF10B981),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // International Delivery Box
                _buildDeliveryCard(
                  topColor: const Color(0xFFF59E0B),
                  icon: Icons.flight_takeoff,
                  iconColor: const Color(0xFFF59E0B),
                  title: 'International Delivery\nDuration',
                  titleColor: const Color(0xFFD4A373),
                  details: [
                    _DeliveryDetail(
                      icon: Icons.access_time,
                      text: 'Takes 10 to 15 working days',
                      iconColor: const Color(0xFFF59E0B),
                    ),
                    _DeliveryDetail(
                      icon: Icons.business,
                      text: 'Shipping Company: Aramex',
                      iconColor: const Color(0xFFF59E0B),
                    ),
                  ],
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

  Widget _buildDeliveryCard({
    required Color topColor,
    required IconData icon,
    required Color iconColor,
    required String title,
    required Color titleColor,
    required List<_DeliveryDetail> details,
  }) {
    return Container(
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
          // Top border
          Container(
            height: 6.h,
            decoration: BoxDecoration(
              color: topColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                Icon(icon, size: 48.sp, color: iconColor),
                SizedBox(height: 16.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                ...details.map((detail) => Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(detail.icon, color: detail.iconColor, size: 24.sp),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              detail.text,
                              style: TextStyle(
                                color: const Color(0xFF475569),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryDetail {
  final IconData icon;
  final String text;
  final Color iconColor;

  _DeliveryDetail({
    required this.icon,
    required this.text,
    required this.iconColor,
  });
}
