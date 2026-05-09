import 'package:elmasa/core/utils/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnPolicyView extends StatelessWidget {
  const ReturnPolicyView({super.key});

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
                      'Return Policy',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // Title
                Center(
                  child: Text(
                    'Return Policy',
                    style: TextStyle(
                      color: const Color(0xFFD09C72),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Link to start return process
                Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Click this link\nto start the\nreturn\nprocess',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFD09C72),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Icon(
                          Icons.arrow_forward,
                          color: const Color(0xFFD09C72),
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h),

                // Info Box
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD3F2F8),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info,
                        color: const Color(0xFF00566C),
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'For a better shopping experience, we added new options:',
                          style: TextStyle(
                            color: const Color(0xFF00566C),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // Checklist
                _buildChecklistItem(
                  'When returning a product or the entire order, a return fee of 29 SAR will be deducted from the refund amount.',
                ),
                _buildChecklistItem(
                  'You can return the product within 7 days of receipt.',
                ),
                _buildChecklistItem(
                  'No return or exchange for online orders at branches.',
                ),
                _buildChecklistItem(
                  'Exchange of products purchased from the online store is not allowed.',
                ),
                _buildChecklistItem(
                  'The product must be in its original condition without damage.',
                ),
                _buildChecklistItem(
                  'The return policy applies to all products except accessories.',
                ),

                SizedBox(height: 32.h),

                // Promotional Offer Return Terms
                Text(
                  'Promotional Offer\nReturn Terms &\nConditions',
                  style: TextStyle(
                    color: const Color(0xFFD09C72),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(height: 1.h, color: Colors.grey.shade300),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'All products included in the promotional offer must be returned in full.',
                        style: TextStyle(
                          color: const Color(0xFF33576E),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                // Return Steps
                Text(
                  'Return Steps',
                  style: TextStyle(
                    color: const Color(0xFFD09C72),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(height: 1.h, color: Colors.grey.shade300),
                SizedBox(height: 16.h),

                _buildStepCard(Icons.person, '1. Go to My Orders panel'),
                SizedBox(height: 16.h),
                _buildStepCard(Icons.description, '2. Create Return Form'),
                SizedBox(height: 16.h),
                _buildStepCard(
                  Icons.email,
                  '3. The policy will be sent to your email within 48 hours',
                ),

                SizedBox(height: 32.h),

                // Notes Box
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F1D8),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: const Color(0xFF5A4A11),
                            size: 24.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Notes',
                            style: TextStyle(
                              color: const Color(0xFF5A4A11),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Divider(color: const Color(0xFFDAC792), thickness: 1.h),
                      SizedBox(height: 8.h),
                      _buildNoteItem(
                        'The order cannot be cancelled after confirmation.',
                      ),
                      SizedBox(height: 8.h),
                      _buildNoteItem(
                        'The amount will be refunded within 14 working days.',
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

  Widget _buildChecklistItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: const Color(0xFF1AA96C),
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xFF003829),
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade300, thickness: 1.h, height: 1.h),
        ],
      ),
    );
  }

  Widget _buildStepCard(IconData icon, String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 32.sp),
          SizedBox(height: 16.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFD09C72),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.h),
          width: 4.w,
          height: 4.w,
          decoration: const BoxDecoration(
            color: Color(0xFF5A4A11),
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF5A4A11),
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
