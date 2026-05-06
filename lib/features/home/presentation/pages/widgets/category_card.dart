import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget categoryCard(String title, List<String> tags, String image) {
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
            children: tags.map((t) => Chip(label: Text(t))).toList(),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );
}
