import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bannerCard(String image, String title, String subtitle) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Stack(
      fit: StackFit.expand,
      children: [
        image.startsWith('http')
            ? Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(color: Colors.grey),
              )
            : Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(color: Colors.grey),
              ),
        Container(color: Colors.black26),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
