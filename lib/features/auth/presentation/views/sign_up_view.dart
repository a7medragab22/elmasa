import 'package:elmasa/core/services/firebase_auth_service.dart';
import 'package:elmasa/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:elmasa/features/auth/data/repos/auth_repo_impl.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:elmasa/features/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:elmasa/features/auth/presentation/views/widgets/sign_up_view_bloc_concumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignupCubit(AuthRepoImpl(firebaseAuthService: FirebaseAuthService())),
      child: Scaffold(
        appBar: AppBar(title: Text('SignUp View')),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SignUpViewBlocConcumer(),
        ),
      ),
    );
  }
}
