import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const MainBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  void _handleNavigation(BuildContext context, int index) {
    if (onTap != null) {
      onTap!(index);
      return;
    }

    // Direct navigation from any page back to the Home shell with the selected tab
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouteNames.home,
      (route) => false,
      arguments: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _handleNavigation(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryYellow,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
        BottomNavigationBarItem(
          icon: ListenableBuilder(
            listenable: CartManager.instance,
            builder: (context, _) {
              int count = CartManager.instance.totalItems;
              return count > 0
                  ? Badge(
                      label: Text('$count'),
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.shopping_cart),
                    )
                  : const Icon(Icons.shopping_cart);
            },
          ),
          label: 'Cart',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Offers'),
        const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
