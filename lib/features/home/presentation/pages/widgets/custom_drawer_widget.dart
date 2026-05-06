import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/features/auth/presentation/views/signin_view.dart';
import 'package:elmasa/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Items
            Expanded(
              child: ListView(
                children: [
                  DrawerItem(icon: Icons.home_outlined, title: "Home"),
                  DrawerItem(
                    icon: Icons.inventory_2_outlined,
                    title: "Fabrics",
                  ),
                  DrawerItem(icon: Icons.checkroom_outlined, title: "Abayas"),
                  DrawerItem(icon: Icons.checkroom, title: "Clothes"),
                  DrawerItem(icon: Icons.inventory_2, title: "Leather"),
                  DrawerItem(
                    icon: Icons.auto_awesome_outlined,
                    title: "Giveaways",
                  ),
                  DrawerItem(icon: Icons.mail_outline, title: "Contact Us"),
                  DrawerItem(
                    icon: Icons.app_registration,
                    title: 'register',
                    onTap: () {
                      Navigator.pushNamed(context, AppRouteNames.signup);
                    },
                  ),

                  DrawerItem(
                    icon: Icons.login,
                    title: 'login',
                    onTap: () {
                      Navigator.pushNamed(context, AppRouteNames.signin);
                    },
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

  DrawerItem({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          onTap: onTap,
        ),

        const Divider(height: 1),
      ],
    );
  }
}
