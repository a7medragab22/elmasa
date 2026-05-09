import 'dart:async';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/features/home/presentation/pages/widgets/banner_card.dart';
import 'package:elmasa/features/home/presentation/pages/widgets/category_card.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/themes/app_colors.dart';
import 'package:elmasa/features/home/presentation/pages/widgets/custom_app_bar.dart';
import 'package:elmasa/features/home/presentation/pages/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentBannerIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  final List<String> _supportTags = [
    'Casual',
    'Evening',
    'Silk',
    'Men',
    'Bags',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
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
      drawer: CustomDrawer(),

      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),

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
                      bannerCard(
                        'https://picsum.photos/seed/b1/400/200',
                        'For Sale',
                        'Selected items',
                      ),
                      bannerCard(
                        'https://picsum.photos/seed/b2/400/200',
                        'Premium',
                        'Luxury fabrics',
                      ),
                      bannerCard(
                        'https://picsum.photos/seed/b3/400/200',
                        'Discover',
                        'New Arrivals',
                      ),
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
                        color: _currentBannerIndex == index
                            ? Colors.black87
                            : Colors.grey.shade400,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16.h),
                // Categories
                categoryCard('Abayas', [
                  'Casual',
                  'Evening',
                  'Umrah',
                ], 'assets/abayaa.jpg'),
                categoryCard('Fabrics', [
                  'Cotton',
                  'Silk',
                  'Wool',
                ], 'assets/clothes.jpg'),
                categoryCard('Clothes', [
                  'Men',
                  'Women',
                  'Kids',
                ], 'assets/fabrics-bg.jpg'),
                categoryCard('Leather', [
                  'Bags',
                  'Wallets',
                  'Accessories',
                ], 'assets/lather-bg.jpg'),
                categoryCard('Giveaways', [
                  'Active',
                  'Past',
                  'Upcoming',
                ], 'assets/giveaways.jpg'),
                SizedBox(height: 16.h),
                Text(
                  'Support Tags',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: _supportTags.map((t) {
                    return ActionChip(
                      label: Text(t),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteNames.products,
                          arguments: t,
                        );
                      },
                    );
                  }).toList(),
                ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}
