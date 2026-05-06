import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black87),
        onPressed: () {
          // Open drawer if there's one, or handle menu click
          Scaffold.maybeOf(context)?.openDrawer();
        },
      ),
      title: Image.asset(
        'assets/logo.png', // Assuming this is the logo used in the footer
        height: 40.h,
        errorBuilder: (c, e, s) => Container(
          height: 40.h,
          width: 40.w,
          color: Colors.grey,
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.brown.shade300, size: 28.sp),
              onPressed: () {},
            ),
            Positioned(
              right: 8.w,
              top: 8.h,
              child: Container(
                padding: EdgeInsets.all(4.sp),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E3A34), // Dark green color
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
