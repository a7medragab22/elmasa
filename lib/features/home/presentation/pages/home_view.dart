import 'dart:async';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/footer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentBannerIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds:3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentBannerIndex + 1;
        if (nextPage > 2) {
          nextPage = 0; // Wrap around to first page
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Slider Banners
          SizedBox(
            height: 180.h,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentBannerIndex = index;
                });
              },
              children: [
                bannerCard('https://picsum.photos/seed/b1/400/200', 'For Sale', 'Selected items'),
                bannerCard('https://picsum.photos/seed/b2/400/200', 'Premium', 'Luxury fabrics'),
                bannerCard('https://picsum.photos/seed/b3/400/200', 'Discover', 'New Arrivals'),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentBannerIndex == index ? Colors.black87 : Colors.grey.shade400,
                ),
              );
            }),
          ),
          SizedBox(height: 16.h),
          // Categories
          categoryCard('Abayas', ['Casual', 'Evening', 'Umrah'], 'assets/abayaa.jpg'),
          categoryCard('Fabrics', ['Cotton', 'Silk', 'Wool'], 'assets/clothes.jpg'),
          categoryCard('Clothes', ['Men', 'Women', 'Kids'], 'assets/fabrics-bg.jpg'),
          categoryCard('Leather', ['Bags', 'Wallets', 'Accessories'], 'assets/lather-bg.jpg'),
                categoryCard('Giveaways', ['Active', 'Past', 'Upcoming'], 'assets/giveaways.jpg'),
              ],
            ),
          ),
          const AppFooter(),
          SizedBox(height: 80.h), // for bottom nav
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Support'),
        ],
      ),
    );
  }

  Widget bannerCard(String image, String title, String subtitle) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          image.startsWith('http')
              ? Image.network(image, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey))
              : Image.asset(image, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey)),
          Container(color: Colors.black26),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(String title, List<String> tags, String image) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image.startsWith('http')
              ? Image.network(image, height: 150.h, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(height: 150.h, color: Colors.grey))
              : Image.asset(image, height: 150.h, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(height: 150.h, color: Colors.grey)),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(title, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Wrap(
              spacing: 8.w,
              children: tags.map((t) => Chip(label: Text(t))).toList(),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
