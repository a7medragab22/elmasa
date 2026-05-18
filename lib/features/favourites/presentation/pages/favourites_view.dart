import 'package:elmasa/core/utils/favourites_manager.dart';
import 'package:elmasa/core/utils/widgets/custom_empty_card.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:elmasa/features/favourites/presentation/widgets/favourites_header.dart';
import 'package:elmasa/features/favourites/presentation/widgets/wishlist_item_card.dart';
import 'package:elmasa/features/favourites/presentation/widgets/wishlist_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListenableBuilder(
          listenable: FavouritesManager.instance,
          builder: (context, _) {
            final items = FavouritesManager.instance.items;
            return Column(
              children: [
                FavouritesHeader(
                  isGridView: isGridView,
                  onToggle: (val) => setState(() => isGridView = val),
                  showToggle: items.isNotEmpty,
                ),
                const Divider(height: 1),
                Expanded(
                  child: items.isEmpty
                      ? _buildEmptyState(context)
                      : isGridView
                      ? _buildGridView(items)
                      : _buildListView(items),
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
      icon: Icons.favorite_border,
      title: S.of(context).yourWishlistIsEmpty,
      subtitle: S.of(context).saveItemsYouLove,
      buttonText: S.of(context).exploreProducts,
      onButtonPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.home,
          (route) => false,
        );
      },
    );
  }

  Widget _buildGridView(List<Product> items) {
    return GridView.builder(
      padding: EdgeInsets.all(20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => WishlistItemCard(product: items[index]),
    );
  }

  Widget _buildListView(List<Product> items) {
    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: items.length,
      itemBuilder: (context, index) => WishlistItemList(product: items[index]),
    );
  }
}
