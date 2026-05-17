import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [_TopFooter(), _BottomFooter()]);
  }
}

class _TopFooter extends StatelessWidget {
  const _TopFooter();

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF003829);
    return Container(
      width: double.infinity,
      color: const Color(0xFFEBE6C2),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 150.h,
              errorBuilder: (c, e, s) =>
                  Container(height: 150.h, width: 150.w, color: Colors.grey),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "THE FIRST DESTINATION FOR ALL\n✨ WOMEN'S DETAILS",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 24.h),
          const _InfoRow(
            'assets/footer-1.jpg',
            'COMMERCIAL REGISTRATION',
            '1010166254',
          ),
          SizedBox(height: 16.h),
          const _InfoRow(
            'assets/footer-2.jpg',
            'TAX NUMBER',
            '300076485500003',
          ),
          SizedBox(height: 32.h),
          Text(
            'Important Links',
            style: TextStyle(
              color: textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterLink(
                      'Blog',
                      onTap: () {
                        Navigator.pushNamed(context, AppRouteNames.blog);
                      },
                    ),
                    _FooterLink(
                      'Return Policy',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.returnPolicy,
                        );
                      },
                    ),
                    _FooterLink(
                      'Terms & Conditions',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.termsConditions,
                        );
                      },
                    ),
                    _FooterLink(
                      'Delivery Service',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.deliveryService,
                        );
                      },
                    ),
                    _FooterLink(
                      'Privacy Policy',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.privacyPolicy,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterLink(
                      'Contact Us',
                      onTap: () {
                        Navigator.pushNamed(context, AppRouteNames.contactUs);
                      },
                    ),
                    _FooterLink(
                      'Return Method',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.returnMethod,
                        );
                      },
                    ),
                    _FooterLink(
                      'Gift Policy',
                      onTap: () {
                        Navigator.pushNamed(context, AppRouteNames.giftPolicy);
                      },
                    ),
                    _FooterLink(
                      'Sad VIP Points',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.sadVipPoints,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Center(
            child: Text(
              'Contact Us',
              style: TextStyle(
                color: textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ContactButton(
                'Email',
                Icons.email,
                onTap: () => _launchURL(context, 'mailto:info@store.com'),
              ),
              SizedBox(width: 8.w),
              _ContactButton(
                'Phone',
                Icons.phone,
                onTap: () => _launchURL(context, 'tel:+966565532971'),
              ),
              SizedBox(width: 8.w),
              _ContactButton(
                'WhatsApp',
                Icons.chat,
                onTap: () => _launchURL(context, 'https://wa.me/966565532971'),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg',
                height: 40.h,
                errorBuilder: (c, e, s) => SizedBox(height: 40.h),
              ),
              SizedBox(width: 8.w),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg',
                height: 40.h,
                errorBuilder: (c, e, s) => SizedBox(height: 40.h),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Center(
            child: Image.asset(
              'assets/sbc.jpg',
              height: 60.h,
              errorBuilder: (c, e, s) =>
                  Container(height: 60.h, width: 60.w, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8.h),
          const Center(
            child: Text(
              'Certified on the Business Platform',
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String imagePath;
  final String title;
  final String value;
  const _InfoRow(this.imagePath, this.title, this.value);

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF003829);
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 50.w,
          height: 50.h,
          errorBuilder: (c, e, s) =>
              Container(width: 50.w, height: 50.h, color: Colors.grey),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const _FooterLink(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF003829),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const _ContactButton(this.title, this.icon, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF003829)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF003829),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(icon, color: const Color(0xFF003829), size: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomFooter extends StatelessWidget {
  const _BottomFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF223A31),
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              text: 'All rights reserved © ',
              style: TextStyle(color: Colors.orangeAccent),
              children: [
                TextSpan(
                  text: 'Saad Store',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: ' 2026 - By\n'),
                TextSpan(
                  text: 'GMTWEB',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            alignment: WrapAlignment.center,
            children: const [
              _PaymentBadge('assets/mada_mini.jpg'),
              _PaymentBadge('assets/credit_card_mini.jpg'),
              _PaymentBadge('assets/customer_wallet_mini.png'),
              _PaymentBadge('assets/tabby_installment_mini.jpg'),
              _PaymentBadge('assets/tamara_installment_mini.jpg'),
              _PaymentBadge('assets/mispay_installment_mini.jpg'),
            ],
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            alignment: WrapAlignment.center,
            children: const [
              _SocialIcon(FontAwesomeIcons.facebookF),
              _SocialIcon(FontAwesomeIcons.youtube),
              _SocialIcon(FontAwesomeIcons.tiktok),
              _SocialIcon(FontAwesomeIcons.snapchat),
              _SocialIcon(FontAwesomeIcons.xTwitter),
              _SocialIcon(FontAwesomeIcons.instagram),
            ],
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class _PaymentBadge extends StatelessWidget {
  final String imagePath;
  const _PaymentBadge(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (c, e, s) => const SizedBox(),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final FaIconData icon;
  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(color: Colors.orangeAccent, width: 1.w),
      ),
      child: Center(
        child: FaIcon(icon, color: Colors.white, size: 20.sp),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String urlString) async {
  try {
    final Uri uri = Uri.parse(urlString);
    bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      launched = await launchUrl(uri);
    }
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open link: $urlString')),
      );
    }
  } catch (e) {
    debugPrint('Error launching URL: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().contains('MissingPluginException')
                ? 'Please restart the app completely (stop and run again) to load the new url_launcher package!'
                : 'Error: $e',
          ),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}
