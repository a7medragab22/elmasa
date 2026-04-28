import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopFooter(),
        _BottomFooter(),
      ],
    );
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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 150,
              errorBuilder: (c, e, s) => Container(height: 150, width: 150, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "THE FIRST DESTINATION FOR ALL\n✨ WOMEN'S DETAILS",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1),
          ),
          const SizedBox(height: 24),
          _InfoRow('assets/footer-1.jpg', 'COMMERCIAL REGISTRATION', '1010166254'),
          const SizedBox(height: 16),
          _InfoRow('assets/footer-2.jpg', 'TAX NUMBER', '300076485500003'),
          const SizedBox(height: 32),
          const Text('Important Links', style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _FooterLink('Blog'),
                    _FooterLink('Return Policy'),
                    _FooterLink('Terms & Conditions'),
                    _FooterLink('Delivery Service'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _FooterLink('Contact Us'),
                    _FooterLink('Return Method'),
                    _FooterLink('Gift Policy'),
                    _FooterLink('Sad VIP Points'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Center(child: Text('Contact Us', style: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _ContactButton('Email', Icons.email),
              SizedBox(width: 8),
              _ContactButton('Phone', Icons.phone),
              SizedBox(width: 8),
              _ContactButton('WhatsApp', Icons.chat),
            ],
          ),
          const SizedBox(height: 32),
          const Center(child: Text('Download Mobile App', style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg', height: 40, errorBuilder: (c, e, s) => const SizedBox(height: 40)),
              const SizedBox(width: 8),
              Image.network('https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg', height: 40, errorBuilder: (c, e, s) => const SizedBox(height: 40)),
            ],
          ),
          const SizedBox(height: 32),
          Center(child: Image.asset('assets/sbc.jpg', height: 60, errorBuilder: (c, e, s) => Container(height: 60, width: 60, color: Colors.grey))),
          const SizedBox(height: 8),
          const Center(child: Text('Certified on the Business Platform', style: TextStyle(color: textColor, fontWeight: FontWeight.bold))),
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
        Image.asset(imagePath, width: 50, height: 50, errorBuilder: (c, e, s) => Container(width: 50, height: 50, color: Colors.grey)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(text, style: const TextStyle(color: Color(0xFF003829), fontWeight: FontWeight.bold)),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const _ContactButton(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF003829)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Color(0xFF003829), fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Icon(icon, color: const Color(0xFF003829), size: 16),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              text: 'All rights reserved © ',
              style: TextStyle(color: Colors.orangeAccent),
              children: [
                TextSpan(text: 'Saad Store', style: TextStyle(color: Colors.blue)),
                TextSpan(text: ' 2026 - By\n'),
                TextSpan(text: 'GMTWEB', style: TextStyle(color: Colors.blue)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
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
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: const [
              _SocialIcon(Icons.close),
              _SocialIcon(Icons.camera_alt),
              _SocialIcon(Icons.music_note),
              _SocialIcon(Icons.play_arrow),
              _SocialIcon(Icons.facebook),
            ],
          ),
          const SizedBox(height: 24),
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
      width: 45,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(imagePath, fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox()),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(color: Colors.orangeAccent, width: 1),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
