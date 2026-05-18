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
import 'package:elmasa/generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showSnackBarWidget(context, S.of(context).accountCreatedSuccessfully);
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouteNames.signin,
              (route) => false,
            );
          } else {
            showSnackBarWidget(context, S.of(context).verifyEmail);
          }
        } else if (state is SignupFailureState) {
          showSnackBarWidget(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is SignupLoadingState,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          CustomTextField(
                            hintText: S.of(context).name,
                            onSaved: (value) {
                              name = value;
                            },
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            hintText: S.of(context).emailAddress,
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            hintText: S.of(context).phone,
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            hintText: S.of(context).password,
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
                            hintText: S.of(context).confirmPassword,
                            obscureText: !isConfirmPasswordVisible,
                            onSaved: (value) {
                              password = value;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isConfirmPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                          const Spacer(),
                          CustomButton(
                            buttonName: S.of(context).createAccount,
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
                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
