import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/core/utils/favourites_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

class FavouritesHeader extends StatelessWidget {
  final bool isGridView;
  final bool showToggle;
  final Function(bool) onToggle;

  const FavouritesHeader({
    super.key,
    required this.isGridView,
    required this.onToggle,
    this.showToggle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).myWishlist,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              ListenableBuilder(
                listenable: FavouritesManager.instance,
                builder: (context, _) {
                  return Text(
                    '${FavouritesManager.instance.totalItems} ${S.of(context).itemsSaved}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                  );
                },
              ),
            ],
          ),
          if (showToggle)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  _buildToggleBtn(Icons.grid_view, isGridView),
                  _buildToggleBtn(Icons.list, !isGridView),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildToggleBtn(IconData icon, bool isActive) {
    return GestureDetector(
      onTap: () => onToggle(icon == Icons.grid_view),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          icon,
          size: 20.sp,
          color: isActive ? AppColors.primaryGreen : Colors.grey,
        ),
      ),
    );
  }
}
