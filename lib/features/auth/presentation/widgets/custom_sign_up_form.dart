import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/core/utils/widgets/show_snack_bar_widget.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showSnackBarWidget(context, 'Account created successfully');
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouteNames.signin,
              (route) => false,
            );
          } else {
            showSnackBarWidget(context, 'Please verify your email');
          }
        } else if (state is SignupFailureState) {
          showSnackBarWidget(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is SignupLoadingState,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 40.h),

                CustomTextField(
                  hintText: 'Name',
                  onSaved: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'Email',
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'phone',
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'password',
                  obscureText: !isPasswordVisible,
                  onSaved: (value) {
                    email = value;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'confirm password',
                  obscureText: !isConfirmPasswordVisible,
                  onSaved: (value) {
                    password = value;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_outlined),
                  ),
                ),

                SizedBox(height: 45.h),
                CustomButton(
                  buttonName: 'Create Account',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await context.read<SignupCubit>().call(
                        email: email!,
                        password: password!,
                      );
                    }
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
