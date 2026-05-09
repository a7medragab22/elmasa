import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/widgets/footer_widget.dart';
import '../../../../core/widgets/main_app_bar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const MainAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text('Shopping Cart', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp)),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20.sp),
                      Text('Checkout', style: TextStyle(color: const Color(0xFF1E293B), fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  
                  Text('Billing & Shipping Details', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                  SizedBox(height: 16.h),
                  
                  // Form Card
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputField('Full Name', isRequired: true),
                        SizedBox(height: 16.h),
                        _buildInputField('Phone', isRequired: true, keyboardType: TextInputType.phone),
                        SizedBox(height: 16.h),
                        _buildInputField('Email (Optional)', keyboardType: TextInputType.emailAddress),
                        SizedBox(height: 16.h),
                        _buildInputField('City', isRequired: true, hintText: 'Select City / Region'),
                        SizedBox(height: 16.h),
                        _buildInputField('Address', isRequired: true),
                        SizedBox(height: 16.h),
                        _buildInputField('Order Notes (Optional)', maxLines: 4),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 40.h),
                  Text('Your Order', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                  SizedBox(height: 16.h),
                  
                  // Order Summary Card
                  _buildOrderSummaryCard(),
                ],
              ),
            ),
            const AppFooter(),
            SizedBox(height: 80.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget _buildInputField(String label, {bool isRequired = false, int maxLines = 1, String? hintText, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(color: const Color(0xFF1E293B), fontSize: 14.sp, fontWeight: FontWeight.w600),
            children: [
              if (isRequired) TextSpan(text: ' *', style: TextStyle(color: Colors.red, fontSize: 14.sp)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
          validator: isRequired ? (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          } : null,
        ),
      ],
    );
  }

  Widget _buildOrderSummaryCard() {
    final manager = CartManager.instance;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Items
          ...manager.items.map((item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: item.imageUrl.isNotEmpty
                            ? ClipRRect(borderRadius: BorderRadius.circular(8.r), child: Image.network(item.imageUrl, fit: BoxFit.cover))
                            : null,
                      ),
                      Positioned(
                        top: -8.h,
                        right: -8.w,
                        child: Container(
                          padding: EdgeInsets.all(6.sp),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1E293B),
                            shape: BoxShape.circle,
                          ),
                          child: Text('${item.quantity}', style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                        SizedBox(height: 4.h),
                        Text('${item.price.toStringAsFixed(0)} SAR', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
                      ],
                    ),
                  ),
                  Text('${(item.price * item.quantity).toStringAsFixed(0)} SAR', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                ],
              ),
            );
          }),
          
          Divider(color: Colors.grey.shade300, height: 32.h),
          
          _buildSummaryRow('Subtotal (Excl. Tax)', '${manager.subtotal.toStringAsFixed(2)} SAR', Colors.grey.shade600, const Color(0xFF1E293B), isBold: true),
          SizedBox(height: 16.h),
          _buildSummaryRow('VAT (15%)', '${manager.vat.toStringAsFixed(2)} SAR', Colors.grey.shade600, const Color(0xFF1E293B), isBold: true),
          SizedBox(height: 16.h),
          _buildSummaryRow('Shipping Cost', '--', Colors.grey.shade600, Colors.green.shade600),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade300, height: 32.h),
          _buildSummaryRow('Total', '--', const Color(0xFF1E293B), Colors.blue.shade600, isBold: true, isTotal: true),
          
          SizedBox(height: 24.h),
          
          // Payment Method
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.chat_bubble_outline, color: Colors.green, size: 24.sp),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: const Color(0xFF1E293B))),
                    SizedBox(height: 4.h),
                    Text('Pay & Confirm via WhatsApp', style: TextStyle(color: Colors.grey.shade600, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24.h),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Submit logic
                  CartManager.instance.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed successfully!')));
                  Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.home, (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A34),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Place Order', style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, Color titleColor, Color valueColor, {bool isBold = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: titleColor, fontSize: isTotal ? 20.sp : 14.sp, fontWeight: isBold || isTotal ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(color: valueColor, fontSize: isTotal ? 20.sp : 14.sp, fontWeight: isBold || isTotal ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
