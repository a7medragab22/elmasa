import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/custom_app_bar.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

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
                      S.of(context).termsAndConditions,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),

                // Title
                Center(
                  child: Column(
                    children: [
                      Text(
                        S.of(context).termsAndConditions,
                        style: TextStyle(
                          color: const Color(0xFF003829),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 100.w,
                        height: 3.h,
                        color: const Color(0xFF003829),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),

                // Sections
                _buildTermCard(
                  color: Colors.blue,
                  icon: Icons.balance,
                  title: S.of(context).intellectualPropertyTitle,
                  content: S.of(context).intellectualPropertyContent,
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.amber,
                  icon: Icons.local_offer,
                  title: S.of(context).weekendFlashSaleTitle,
                  content: S.of(context).weekendFlashSaleContent,
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.green,
                  icon: Icons.shopping_cart,
                  title: S.of(context).ordersPricingTitle,
                  content: S.of(context).ordersPricingContent,
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.cyan,
                  icon: Icons.credit_card,
                  title: S.of(context).pricesPaymentPolicyTitle,
                  content: S.of(context).pricesPaymentPolicyContent,
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.redAccent,
                  icon: Icons.card_giftcard,
                  title: S.of(context).offersDiscountsTitle,
                  content: S.of(context).offersDiscountsContent,
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.red,
                  icon: Icons.assignment_return,
                  title: S.of(context).offerReturnPolicyTitle,
                  content: S.of(context).offerReturnPolicyContent,
                ),
                SizedBox(height: 32.h),

                // Expandable sections
                _buildExpandableSection(
                  icon: Icons.privacy_tip,
                  title: S.of(context).liabilityPrivacyTitle,
                  content: S.of(context).liabilityPrivacyContent,
                  isExpanded: true,
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.gavel,
                  title: S.of(context).lawDisputesTitle,
                  content: S.of(context).lawDisputesContent,
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.comment,
                  title: S.of(context).repliesCommentsTitle,
                  content: S.of(context).repliesCommentsContent,
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.edit,
                  title: S.of(context).orderModificationTitle,
                  content: S.of(context).orderModificationContent,
                ),

                SizedBox(height: 48.h),

                // Copyright text
                Center(
                  child: Text(
                    S.of(context).allRightsReserved,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
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

  Widget _buildTermCard({
    required Color color,
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(icon, color: color, size: 28.sp),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: const Color(0xFF1E293B),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      content,
                      style: TextStyle(
                        color: const Color(0xFF475569),
                        fontSize: 15.sp,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required IconData icon,
    required String title,
    required String content,
    bool isExpanded = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          leading: Icon(icon, color: Colors.grey.shade600, size: 24.sp),
          title: Text(
            title,
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: const Color(0xFF1E293B),
          collapsedIconColor: const Color(0xFF1E293B),
          children: [
            Divider(color: Colors.grey.shade200, height: 1),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                content,
                style: TextStyle(
                  color: const Color(0xFF475569),
                  fontSize: 15.sp,
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
