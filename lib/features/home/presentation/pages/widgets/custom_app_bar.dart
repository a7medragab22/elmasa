import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: CustomTextField(hintText: 'snndn'),

      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black87,
            size: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black87,
            size: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(500, 120);
}
