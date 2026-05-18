import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elmasa/core/cubit/locale_cubit.dart';
import 'package:elmasa/generated/l10n.dart';

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
                  Text(
                    S.of(context).menu,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryYellow,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.secondaryYellow,
                    ),
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
                    icon: Icons.language,
                    title: context.read<LocaleCubit>().state.languageCode == 'en' ? 'عربي' : 'English',
                    onTap: () {
                      context.read<LocaleCubit>().toggleLanguage();
                    },
                  ),
                  DrawerItem(
                    icon: Icons.home_outlined,
                    title: S.of(context).home,
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteNames.home,
                      (route) => false,
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.inventory_2_outlined,
                    title: S.of(context).fabrics,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRouteNames.products,
                      arguments: "Fabrics",
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.checkroom_outlined,
                    title: S.of(context).abayas,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRouteNames.products,
                      arguments: "Abayas",
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.checkroom,
                    title: S.of(context).clothes,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRouteNames.products,
                      arguments: "Clothes",
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.inventory_2,
                    title: S.of(context).leather,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRouteNames.products,
                      arguments: "Leather",
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.auto_awesome_outlined,
                    title: S.of(context).giveaways,
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRouteNames.products,
                      arguments: "Giveaways",
                    ),
                  ),
                  DrawerItem(
                    icon: Icons.mail_outline,
                    title: S.of(context).contactUs,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouteNames.contactUs),
                  ),
                  DrawerItem(
                    icon: Icons.app_registration,
                    title: S.of(context).register,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouteNames.signup),
                  ),
                  DrawerItem(
                    icon: Icons.login,
                    title: S.of(context).login,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouteNames.signin),
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
          leading: Icon(icon, color: AppColors.secondaryYellow),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.secondaryYellow,
            ),
          ),
          onTap: onTap,
        ),
        Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
      ],
    );
  }
}
