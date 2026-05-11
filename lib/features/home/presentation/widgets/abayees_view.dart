import 'package:elmasa/features/home/presentation/cubits/favroit_cubit/favroit_cubit.dart';
import 'package:elmasa/features/home/presentation/widgets/category_card.dart';
import 'package:elmasa/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:elmasa/features/home/presentation/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AbayasScreen extends StatefulWidget {
  const AbayasScreen({
    super.key,
    required this.selectedCategory,
    required this.tags,
  });

  final String selectedCategory;
  final List<String> tags;

  @override
  State<AbayasScreen> createState() => _AbayasScreenState();
}

class _AbayasScreenState extends State<AbayasScreen> {
  late String selectedTag;

  @override
  void initState() {
    super.initState();

    selectedTag = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      return product["category"] == selectedTag;
    }).toList();
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Abayas",
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  /// CATEGORY DROPDOWN
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      height: 55.h,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedTag,
                          isExpanded: true,

                          items: widget.tags.map((tag) {
                            return DropdownMenuItem(
                              value: tag,
                              child: Text(tag),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedTag = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  /// SECOND FILTER
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 55.h,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      child: Row(
                        children: const [
                          Text("Our Suggestions"),
                          Expanded(child: Icon(Icons.keyboard_arrow_down)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Divider(),

              SizedBox(height: 20.h),

              Expanded(
                child: GridView.builder(
                  itemCount: filteredProducts.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.45,
                  ),

                  itemBuilder: (context, index) {
                    final filter = filteredProducts[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),

                        borderRadius: BorderRadius.circular(16.r),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          /// IMAGE
                          BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, state) {
                              final isFav = context
                                  .read<FavoriteCubit>()
                                  .isFavorite(filter);
                              return Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r),
                                    ),

                                    child: Image.asset(
                                      "assets/abayaa.jpg",

                                      height: 220.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Positioned(
                                    top: 10.h,
                                    right: 10.w,

                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<FavoriteCubit>()
                                            .toggleFavorite(filter);
                                      },
                                      child: CircleAvatar(
                                        radius: 22.r,
                                        backgroundColor: Colors.white,

                                        child: Icon(
                                          context
                                                  .read<FavoriteCubit>()
                                                  .isFavorite(filter)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              context
                                                  .read<FavoriteCubit>()
                                                  .isFavorite(filter)
                                              ? Colors.red
                                              : Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                          /// TEXT
                          Padding(
                            padding: EdgeInsets.all(12.w),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "$selectedTag Abaya",

                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 8.h),

                                Text(
                                  "SAR 299",

                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
