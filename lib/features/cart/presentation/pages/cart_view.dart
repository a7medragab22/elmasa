import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes_name.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool _showBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const MainAppBar(),
      body: ListenableBuilder(
        listenable: CartManager.instance,
        builder: (context, _) {
          final items = CartManager.instance.items;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              if (items.isNotEmpty && _showBanner) _buildSuccessBanner(),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breadcrumbs
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.home, (route) => false),
                          child: Text('Home', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20.sp),
                        Text('Shopping Cart', style: TextStyle(color: const Color(0xFF1E293B), fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    if (items.isEmpty)
                      _buildEmptyState()
                    else
                      Column(
                        children: [
                          _buildOrderSummary(),
                          SizedBox(height: 24.h),
                          ...items.map((item) => _buildCartItem(item)),
                        ],
                      ),
                  ],
                ),
              ),
              const AppFooter(),
              SizedBox(height: 80.h),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget _buildSuccessBanner() {
    return Container(
      width: double.infinity,
      color: Colors.green.shade50,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cart updated',
            style: TextStyle(color: Colors.green.shade800, fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _showBanner = false;
              });
            },
            child: Icon(Icons.close, color: Colors.green.shade800, size: 18.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Icon(Icons.shopping_basket, size: 80.sp, color: Colors.grey.shade600),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18.sp, color: Colors.brown.shade300, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteNames.products);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E293B),
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            child: Text('Browse Products', style: TextStyle(color: Colors.white, fontSize: 16.sp)),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    final manager = CartManager.instance;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: TextStyle(color: Colors.brown.shade400, fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 16.h),
          _buildSummaryRow('Subtotal (Excl. Tax)', '${manager.subtotal.toStringAsFixed(2)} SAR', Colors.brown.shade300),
          SizedBox(height: 8.h),
          _buildSummaryRow('VAT (15%)', '${manager.vat.toStringAsFixed(2)} SAR', Colors.brown.shade300),
          SizedBox(height: 16.h),
          _buildSummaryRow('Total', '${manager.total.toStringAsFixed(2)} SAR', Colors.brown.shade600, isBold: true),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.checkout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
              ),
              child: Text('Proceed to Checkout', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, Color color, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: color, fontSize: 14.sp, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(color: color, fontSize: 14.sp, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delete icon + Image
              Column(
                children: [
                  InkWell(
                    onTap: () => CartManager.instance.removeItem(item.id),
                    child: Icon(Icons.close, color: Colors.red.shade300, size: 20.sp),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 80.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: item.imageUrl.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.network(item.imageUrl, fit: BoxFit.cover, errorBuilder: (c,e,s) => Icon(Icons.image, color: Colors.grey.shade400)),
                          )
                        : Icon(Icons.image, color: Colors.grey.shade400),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: TextStyle(color: Colors.brown.shade400, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8.h),
                    Text('${item.price.toStringAsFixed(0)} SAR', style: TextStyle(color: Colors.brown.shade300, fontSize: 14.sp)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade200),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Quantity control
              Row(
                children: [
                  InkWell(
                    onTap: () => CartManager.instance.updateQuantity(item.id, -1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Text('-', style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade600)),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text('${item.quantity}', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(width: 16.w),
                  InkWell(
                    onTap: () => CartManager.instance.updateQuantity(item.id, 1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Text('+', style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade600)),
                    ),
                  ),
                ],
              ),
              Text('Total: ${(item.price * item.quantity).toStringAsFixed(0)} SAR', 
                style: TextStyle(color: Colors.brown.shade600, fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
