<<<<<<< HEAD
import 'package:elmasa/features/home/presentation/cubits/favroit_cubit/favroit_cubit.dart';
import 'package:elmasa/features/home/presentation/widgets/abayees_view.dart';
import 'package:elmasa/features/home/presentation/widgets/custom_drawer_widget.dart';
=======
import 'package:elmasa/core/routes/app_routes_name.dart';
>>>>>>> 4914e944932215727378b2172dfc2b19cea504ce
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<< HEAD
Widget categoryCard(
  String title,
  List<String> tags,
  String image,
  BuildContext context,
) {
  return Card(
    margin: EdgeInsets.only(bottom: 16.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image.startsWith('http')
            ? Image.network(
                image,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) =>
                    Container(height: 150.h, color: Colors.grey),
              )
            : Image.asset(
                image,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) =>
                    Container(height: 150.h, color: Colors.grey),
              ),

        Padding(
          padding: EdgeInsets.all(8.w),
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Wrap(
            spacing: 8.w,
            children: tags
                .map(
                  (t) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              AbayasScreen(selectedCategory: t, tags: tags),
                        ),
                      );
                    },
                    child: Chip(label: Text(t)),
                  ),
                )
                .toList(),
          ),
        ),

        SizedBox(height: 8.h),
      ],
=======
Widget categoryCard(BuildContext context, String title, List<String> tags, String image) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        AppRouteNames.products,
        arguments: title,
      );
    },
    child: Card(
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image.startsWith('http')
              ? Image.network(
                  image,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) =>
                      Container(height: 150.h, color: Colors.grey),
                )
              : Image.asset(
                  image,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) =>
                      Container(height: 150.h, color: Colors.grey),
                ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Wrap(
              spacing: 8.w,
              children: tags.map((t) => ActionChip(
                label: Text(t),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteNames.products,
                    arguments: t,
                  );
                },
              )).toList(),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
>>>>>>> 4914e944932215727378b2172dfc2b19cea504ce
    ),
  );
}

List<Map<String, dynamic>> products = [
  {
    "name": "Casual Abaya",
    "price": "SAR 299",
    "image": "assets/abayaa.jpg",
    "category": "Casual",
  },
  {
    "name": "Modern Abaya",
    "price": "SAR 350",
    "image": "assets/abayaa.jpg",
    "category": "Modern",
  },
  {
    "name": "Sport Abaya",
    "price": "SAR 200",
    "image": "assets/abayaa.jpg",
    "category": "Sport",
  },
  {
    "name": "Classic Abaya",
    "price": "SAR 400",
    "image": "assets/abayaa.jpg",
    "category": "Classic",
  },
];
