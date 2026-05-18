import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/cart_manager.dart';
import 'package:elmasa/core/utils/widgets/custom_empty_card.dart';
import 'package:elmasa/features/cart/presentation/widgets/cart_header.dart';
import 'package:elmasa/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:elmasa/features/cart/presentation/widgets/cart_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListenableBuilder(
          listenable: CartManager.instance,
          builder: (context, _) {
            final items = CartManager.instance.items;
            return Column(
              children: [
                const CartHeader(),
                const Divider(height: 1),
                Expanded(
                  child: items.isEmpty
                      ? _buildEmptyState(context)
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              // Tablet Layout
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(20.w),
                                      itemCount: items.length,
                                      itemBuilder: (context, index) =>
                                          CartItemCard(item: items[index]),
                                    ),
                                  ),
                                  Container(
                                    width: 300.w,
                                    margin: EdgeInsets.all(20.w),
                                    child: const CartSummarySection(
                                      isTablet: true,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              // Mobile Layout
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  return SingleChildScrollView(
                                    padding: EdgeInsets.all(20.w),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight:
                                            constraints.maxHeight -
                                            40.w, // Account for padding
                                      ),
                                      child: IntrinsicHeight(
                                        child: Column(
                                          children: [
                                            ...items.map(
                                              (item) =>
                                                  CartItemCard(item: item),
                                            ),
                                            const Spacer(),
                                            const CartSummarySection(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return CustomEmptyCard(
      icon: Icons.shopping_cart_outlined,
      title: S.of(context).yourCartIsEmpty,
      subtitle: S.of(context).addItemsToStartShopping,
      buttonText: S.of(context).startShopping,
      onButtonPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.home,
          (route) => false,
        );
      },
    );
  }
}
