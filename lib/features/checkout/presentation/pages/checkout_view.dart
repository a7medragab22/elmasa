import 'package:elmasa/features/checkout/presentation/widgets/checkout_bottom_bar.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_header.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_section_card.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_summary_section.dart';
import 'package:elmasa/features/checkout/presentation/widgets/checkout_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

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
          S.of(context).checkout,
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
                      title: S.of(context).billingAndShippingDetails,
                      children: [
                        CheckoutTextField(
                          label: S.of(context).fullName,
                          hint: S.of(context).enterYourFullName,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: S.of(context).phoneNumber,
                          hint: S.of(context).phoneHint,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: S.of(context).emailOptional,
                          hint: S.of(context).emailHint,
                          isRequired: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: S.of(context).city,
                          hint: S.of(context).cityHint,
                        ),
                        SizedBox(height: 20.h),
                        CheckoutTextField(
                          label: S.of(context).address,
                          hint: S.of(context).addressHint,
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
