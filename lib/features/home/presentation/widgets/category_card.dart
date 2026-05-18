import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmasa/generated/l10n.dart';

String _getLocalizedTag(BuildContext context, String tag) {
  switch (tag.toLowerCase()) {
    case 'casual':
      return S.of(context).tagCasual;
    case 'evening':
      return S.of(context).tagEvening;
    case 'silk':
      return S.of(context).tagSilk;
    case 'men':
      return S.of(context).tagMen;
    case 'bags':
      return S.of(context).tagBags;
    case 'cotton':
      return S.of(context).tagCotton;
    case 'wool':
      return S.of(context).tagWool;
    case 'women':
      return S.of(context).tagWomen;
    case 'kids':
      return S.of(context).tagKids;
    case 'wallets':
      return S.of(context).tagWallets;
    case 'accessories':
      return S.of(context).tagAccessories;
    case 'umrah':
      return S.of(context).tagUmrah;
    case 'active':
      return S.of(context).tagActive;
    case 'past':
      return S.of(context).tagPast;
    case 'upcoming':
      return S.of(context).tagUpcoming;
    default:
      return tag;
  }
}

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
                label: Text(_getLocalizedTag(context, t)),
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
    ),
  );
}
