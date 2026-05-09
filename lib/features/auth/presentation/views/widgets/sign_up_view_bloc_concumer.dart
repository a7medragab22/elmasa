import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:elmasa/features/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SignUpViewBlocConcumer extends StatelessWidget {
  const SignUpViewBlocConcumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showSnackBarWidget(context, 'تم انشاء حساب بنجاح');
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouteNames.signin,
              (route) => false,
            );
          } else {
            showSnackBarWidget(context, 'يجب عليك تاكيد الايميل ');
          }
        } else if (state is SignupFailureState) {
          showSnackBarWidget(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is SignupLoadingState,
          child: CustomSignUpForm(),
        );
      },
    );
  }
}
