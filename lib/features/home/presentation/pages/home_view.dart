import 'dart:async';
import 'package:elmasa/core/utils/widgets/custom_app_bar.dart';
import 'package:elmasa/features/cart/presentation/pages/cart_view.dart';
import 'package:elmasa/features/favourites/presentation/pages/favourites_view.dart';
import 'package:elmasa/features/categories/presentation/pages/categories_view.dart';
import 'package:elmasa/features/categories/data/models/category_model.dart';
import 'package:elmasa/core/utils/widgets/footer_widget.dart';
import 'package:elmasa/features/home/presentation/widgets/banner_card.dart';
import 'package:elmasa/features/home/presentation/widgets/category_card.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/features/home/presentation/widgets/custom_drawer_widget.dart';
import 'package:elmasa/core/utils/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  bool _initialized = false;
  int _currentBannerIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  List<String> get _supportTags => [
    S.of(context).tagCasual,
    S.of(context).tagEvening,
    S.of(context).tagSilk,
    S.of(context).tagMen,
    S.of(context).tagBags,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentBannerIndex + 1;
        if (nextPage > 2) {
          nextPage = 0;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is int) {
        _selectedIndex = args;
      }
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildHomeBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                      context,
                      'https://picsum.photos/seed/b1/400/200',
                      S.of(context).forSale,
                      S.of(context).selectedItems,
                    ),
                    bannerCard(
                      context,
                      'https://picsum.photos/seed/b2/400/200',
                      S.of(context).premium,
                      S.of(context).luxuryFabrics,
                    ),
                    bannerCard(
                      context,
                      'https://picsum.photos/seed/b3/400/200',
                      S.of(context).discover,
                      S.of(context).newArrivals,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
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
              ...appCategories.map(
                (cat) =>
                    categoryCard(
                      context,
                      Localizations.localeOf(context).languageCode == 'ar' ? cat.titleAr : cat.titleEn,
                      cat.tags,
                      cat.imageUrl,
                    ),
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).supportTags,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
        SizedBox(height: 80.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeBody(),
      const CategoriesView(),
      const CartView(),
      const FavouritesView(),
      Center(child: Text(S.of(context).profile)),
    ];

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.background,
      appBar: _selectedIndex == 0 ? const CustomAppBar() : null,
      body: pages[_selectedIndex],
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
