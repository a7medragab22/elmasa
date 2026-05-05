import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/core/widgets/main_app_bar.dart';
import 'package:elmasa/core/widgets/footer_widget.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/widgets/main_bottom_nav_bar.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

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
                      'Terms & Conditions',
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
                        'Terms & Conditions',
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
                  title: 'Intellectual Property &\nLicense',
                  content: 'All content available on this site (including text, design, graphics, logos, icons, images, audio clips, and software) is the exclusive property of (Saad) and its licensors. Saad grants you a limited license for personal use of this site. Saad retains full ownership of this content.',
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.amber,
                  icon: Icons.local_offer,
                  title: 'Weekend Flash Sale',
                  content: 'The 25% discount code [WEEK25] applies to selected items only for 48 hours. The discount does not include free shipping and cannot be combined with other offers. Vouchers and coupons do not apply to discounted products.',
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.green,
                  icon: Icons.shopping_cart,
                  title: 'Orders & Pricing',
                  content: 'All orders are subject to acceptance. We reserve the right to refuse or cancel orders for any reason. Stock availability is not guaranteed. All prices are correct at the time of entry but may change.',
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.cyan,
                  icon: Icons.credit_card,
                  title: 'Prices & Payment\nPolicy',
                  content: 'Prices include VAT. Card payments are subject to verification. Card details must match the holder. Card data will not be stored or sold to third parties, except for the payment gateway.',
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.redAccent,
                  icon: Icons.card_giftcard,
                  title: 'Offers & Discounts',
                  content: 'Code [free10] gives free shipping for 6 months for orders over 199 SAR (App only). ACTAN code applies to (New Saad). AC100 code applies to (New Saad) excluding discounted items.',
                ),
                SizedBox(height: 24.h),

                _buildTermCard(
                  color: Colors.red,
                  icon: Icons.assignment_return,
                  title: 'Offer Return Policy',
                  content: 'Orders within (2 for 95) offer: Individual items cannot be returned; the full offer must be returned. For more than 2 items, returns must be in even numbers.',
                ),
                SizedBox(height: 32.h),

                // Expandable sections
                _buildExpandableSection(
                  icon: Icons.privacy_tip,
                  title: 'Liability & Privacy',
                  content: 'Your submission of personal information is subject to our Privacy Policy. Your use of the site is at your own risk. Saad does not guarantee the site is free from interruptions or errors and is not liable for damages resulting from its use. You agree to indemnify and defend Saad against any claims.',
                  isExpanded: true,
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.gavel,
                  title: 'Law & Disputes',
                  content: 'These terms constitute the entire agreement. If any part is void, the rest remains valid. These terms are governed by the laws of Saudi Arabia. Parties agree to attempt amicable dispute resolution within 30 days before legal action.',
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.comment,
                  title: 'Replies & Comments',
                  content: 'We welcome comments but do not accept confidential info. All submissions become exclusive property of Saad. Profanity or fake addresses are prohibited. We reserve the right to delete or edit data.',
                ),
                SizedBox(height: 16.h),
                _buildExpandableSection(
                  icon: Icons.edit,
                  title: 'Order Modification',
                  content: 'For speed of execution, the order becomes final and unmodifiable after payment. The customer is responsible for reviewing data before completion.',
                ),

                SizedBox(height: 48.h),
                
                // Copyright text
                Center(
                  child: Text(
                    'All rights reserved © Saad 2026',
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

  Widget _buildTermCard({required Color color, required IconData icon, required String title, required String content}) {
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

  Widget _buildExpandableSection({required IconData icon, required String title, required String content, bool isExpanded = false}) {
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
