import 'package:elmasa/features/checkout/presentation/widgets/checkout_bottom_bar.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_header.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_section_card.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_summary_section.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CheckoutHeader(),
            const Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Billing & Shipping Section
                    CheckoutSectionCard(
                      title: 'Billing & Shipping Details',
                      children: [
                        CheckoutTextField(
                          label: 'Full Name',
                          hint: 'Enter your full name',
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: 'Phone Number',
                          hint: '+966 XX XXX XXXX',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: 'Email (Optional)',
                          hint: 'your@email.com',
                          isRequired: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: 'City',
                          hint: 'Riyadh, Jeddah, etc.',
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: 'Address',
                          hint: 'Street, Building, Apartment',
                          maxLines: 2,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Order Summary Section
                    const CheckoutSummarySection(),

                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: CheckoutBottomBar(formKey: _formKey),
    );
  }
}
