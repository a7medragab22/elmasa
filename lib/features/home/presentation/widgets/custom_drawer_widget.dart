import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryGreen,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 22, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white.withValues(alpha: 0.2)),

            // Items
            Expanded(
              child: ListView(
                children: [
                  DrawerItem(
                    icon: Icons.home_outlined,
                    title: "Home",
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.home, (route) => false),
                  ),
                  DrawerItem(
                    icon: Icons.inventory_2_outlined,
                    title: "Fabrics",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.products, arguments: "Fabrics"),
                  ),
                  DrawerItem(
                    icon: Icons.checkroom_outlined,
                    title: "Abayas",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.products, arguments: "Abayas"),
                  ),
                  DrawerItem(
                    icon: Icons.checkroom,
                    title: "Clothes",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.products, arguments: "Clothes"),
                  ),
                  DrawerItem(
                    icon: Icons.inventory_2,
                    title: "Leather",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.products, arguments: "Leather"),
                  ),
                  DrawerItem(
                    icon: Icons.auto_awesome_outlined,
                    title: "Giveaways",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.products, arguments: "Giveaways"),
                  ),
                  DrawerItem(
                    icon: Icons.mail_outline, 
                    title: "Contact Us",
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.contactUs),
                  ),
                  DrawerItem(
                    icon: Icons.app_registration,
                    title: 'Register',
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.signup),
                  ),
                  DrawerItem(
                    icon: Icons.login,
                    title: 'Login',
                    onTap: () => Navigator.pushNamed(context, AppRouteNames.signin),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title, 
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          onTap: onTap,
        ),
        Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
      ],
    );
  }
}
