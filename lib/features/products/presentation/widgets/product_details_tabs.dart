import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/generated/l10n.dart';

class PaymentOptionsCard extends StatelessWidget {
  final double price;
  const PaymentOptionsCard({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final splitPrice = (price / 4).toStringAsFixed(2);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).flexiblePaymentOptions,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 16.h),
          _buildPaymentOption(
            'Tamara',
            S.of(context).splitIn4Payments,
            '${S.of(context).fourTimesSar} $splitPrice',
            'assets/images/tamara.png', // Placeholder or use icon
          ),
          SizedBox(height: 12.h),
          _buildPaymentOption(
            'Tabby',
            S.of(context).buyNowPayLater,
            S.of(context).zeroInterest,
            'assets/images/tabby.png',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, String subtitle, String trailing, String iconPath) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 30.h,
            color: Colors.grey.shade200, // Placeholder for logo
            child: const Icon(Icons.payment, size: 20, color: Colors.grey),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Text(trailing, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
        ],
      ),
    );
  }
}

class ProductTabsSection extends StatefulWidget {
  final Map<String, String> details;
  const ProductTabsSection({super.key, required this.details});

  @override
  State<ProductTabsSection> createState() => _ProductTabsSectionState();
}

class _ProductTabsSectionState extends State<ProductTabsSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryGreen,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryGreen,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(text: S.of(context).productDetailsTab),
            Tab(text: S.of(context).reviews),
          ],
        ),
        SizedBox(
          height: 300.h, // Adjusted height for content
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDetailsTab(),
              _buildReviewsTab(),
            ],
          ),
        ),
      ],
    );
  }

String _getLocalizedDetailKey(BuildContext context, String key) {
  switch (key.toLowerCase()) {
    case 'material':
      return S.of(context).detailMaterial;
    case 'color':
      return S.of(context).detailColor;
    case 'size':
      return S.of(context).detailSize;
    case 'care':
      return S.of(context).detailCare;
    case 'origin':
      return S.of(context).detailOrigin;
    default:
      return key;
  }
}

String _getLocalizedDetailValue(BuildContext context, String value) {
  switch (value.toLowerCase()) {
    case 'premium cotton blend':
      return S.of(context).valPremiumCottonBlend;
    case 'black with gold embroidery':
      return S.of(context).valBlackGoldEmbroidery;
    case 'one size (adjustable)':
      return S.of(context).valOneSizeAdjustable;
    case 'hand wash only':
      return S.of(context).valHandWashOnly;
    case 'made in saudi arabia':
      return S.of(context).valMadeInKsa;
    default:
      return value;
  }
}

  Widget _buildDetailsTab() {
    if (widget.details.isEmpty) {
      return Center(child: Text(S.of(context).noDetailsAvailable));
    }
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: widget.details.entries.map((entry) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_getLocalizedDetailKey(context, entry.key), style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600)),
                Text(_getLocalizedDetailValue(context, entry.value), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReviewsTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.rate_review_outlined, size: 64.sp, color: Colors.grey.shade300),
        SizedBox(height: 16.h),
        Text(
          S.of(context).noReviewsYet,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
        ),
        Text(
          S.of(context).beTheFirstToReview,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade400),
        ),
      ],
    );
  }
}
