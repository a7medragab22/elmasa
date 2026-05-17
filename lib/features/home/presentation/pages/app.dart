import 'package:elmasa/core/routes/on_generate_routs.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/features/home/presentation/cubits/favroit_cubit/favroit_cubit.dart';
import 'package:elmasa/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Standard iPhone X design size, adjust if needed
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          onGenerateRoute: onGenerateRoutes,
          initialRoute: HomeView.routeName,
          title: 'Elmasa',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primaryYellow,
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryYellow,
            ),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: BlocProvider(
        create: (context) => FavoriteCubit(),
        child: const HomeView(),
      ),
    );
  }
}
