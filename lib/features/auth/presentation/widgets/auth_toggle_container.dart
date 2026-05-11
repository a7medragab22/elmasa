import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/features/auth/presentation/widgets/log_in_form.dart';
import 'package:elmasa/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthToggleContainer extends StatefulWidget {
  const AuthToggleContainer({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<AuthToggleContainer> createState() => _AuthToggleContainerState();
}

class _AuthToggleContainerState extends State<AuthToggleContainer> {
  late PageController _pageController;
  late int _currentIndex; // 0 = Login, 1 = Register

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onToggle(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        // Premium Sliding Toggle Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            height: 54.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Sliding Indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOutCubic,
                      alignment: _currentIndex == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        width: width / 2 - 4.w,
                        height: 46.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Tab Buttons
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onToggle(0),
                            behavior: HitTestBehavior.opaque,
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOutCubic,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily:
                                      'Cairo', // Assuming Cairo is used or standard font
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == 0
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                ),
                                child: const Text('Log in'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onToggle(1),
                            behavior: HitTestBehavior.opaque,
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOutCubic,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == 1
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                ),
                                child: const Text('Create Account'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        // Forms Container
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: LogInForm(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SignUpForm(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
