import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/custom_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class ReturnPolicyView extends StatelessWidget {
  const ReturnPolicyView({super.key});

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
                      S.of(context).returnPolicy,
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
                    S.of(context).returnPolicy,
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
                          S.of(context).clickLinkToStartReturn,
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
                          S.of(context).newOptionsAdded,
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
                  S.of(context).returnFeeDeduction,
                ),
                _buildChecklistItem(
                  S.of(context).returnWithin7Days,
                ),
                _buildChecklistItem(
                  S.of(context).noReturnAtBranches,
                ),
                _buildChecklistItem(
                  S.of(context).noExchangeOnline,
                ),
                _buildChecklistItem(
                  S.of(context).originalConditionRequired,
                ),
                _buildChecklistItem(
                  S.of(context).returnExceptAccessories,
                ),

                SizedBox(height: 32.h),

                // Promotional Offer Return Terms
                Text(
                  S.of(context).promoOfferReturnTerms,
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
                        S.of(context).promoOfferReturnFull,
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
                  S.of(context).returnSteps,
                  style: TextStyle(
                    color: const Color(0xFFD09C72),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(height: 1.h, color: Colors.grey.shade300),
                SizedBox(height: 16.h),

                _buildStepCard(Icons.person, S.of(context).returnStep1),
                SizedBox(height: 16.h),
                _buildStepCard(Icons.description, S.of(context).returnStep2),
                SizedBox(height: 16.h),
                _buildStepCard(
                  Icons.email,
                  S.of(context).returnStep3,
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
                            S.of(context).notes,
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
                        S.of(context).noCancelAfterConfirm,
                      ),
                      SizedBox(height: 8.h),
                      _buildNoteItem(
                        S.of(context).refundWithin14Days,
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
