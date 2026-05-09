import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/services/firebase_auth_service.dart';

import 'package:elmasa/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:elmasa/features/auth/data/repos/auth_repo_impl.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:elmasa/features/auth/presentation/views/widgets/custom_signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(AuthRepoImpl(firebaseAuthService: FirebaseAuthService())),
      child: Scaffold(
        appBar: AppBar(title: Text('Login View')),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              if (state is SigninSuccessState) {
                showSnackBarWidget(context, 'تمت تسجيل الدخول بنجاح');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouteNames.home,
                  (route) => false,
                );
              } else if (state is SigninFailureState) {
                showSnackBarWidget(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return Skeletonizer(
                enabled: state is SigninLoadingState,
                child: CustomSigninForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
