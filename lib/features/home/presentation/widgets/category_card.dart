import 'package:elmasa/features/home/presentation/widgets/abayees_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget categoryCard({
  required String title,
  required List<String> tags,
  required String image,
  required BuildContext context,
}) {
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
