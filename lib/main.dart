import 'package:elmasa/core/routes/app_routes.dart';
import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/themes/app_colors.dart';
import 'package:elmasa/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:elmasa/core/cubit/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(
              375,
              812,
            ), // Standard iPhone X design size, adjust if needed
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                locale: locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: AppRoutes.generateRoute,
                initialRoute: AppRouteNames.home,
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
              );
            },
          );
        },
      ),
    );
  }
}
