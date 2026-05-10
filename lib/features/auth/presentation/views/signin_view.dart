import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/services/firebase_auth_service.dart';

import 'package:elmasa/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:elmasa/features/auth/data/repos/auth_repo_impl.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:elmasa/features/auth/presentation/widgets/auth_toggle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key, this.initialIndex = 0});
  static const routeName = 'login';
  final int initialIndex;
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninCubit(
            AuthRepoImpl(firebaseAuthService: FirebaseAuthService()),
          ),
        ),
        BlocProvider(
          create: (context) => SignupCubit(
            AuthRepoImpl(firebaseAuthService: FirebaseAuthService()),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Sign In')),
        body: MultiBlocListener(
          listeners: [
            BlocListener<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninSuccessState) {
                  showSnackBarWidget(context, 'Login successful');
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouteNames.home,
                    (route) => false,
                  );
                } else if (state is SigninFailureState) {
                  showSnackBarWidget(context, state.errMessage);
                }
              },
            ),
            BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccessState) {
                  showSnackBarWidget(context, 'Account created successfully');
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouteNames.home,
                    (route) => false,
                  );
                } else if (state is SignupFailureState) {
                  showSnackBarWidget(context, state.errMessage);
                }
              },
            ),
          ],
          child: AuthToggleContainer(initialIndex: initialIndex),
        ),
      ),
    );
  }
}
