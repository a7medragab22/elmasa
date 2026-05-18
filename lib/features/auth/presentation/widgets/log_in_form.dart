import 'package:elmasa/core/routes/app_routes_name.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:elmasa/generated/l10n.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is SigninLoadingState,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      autovalidateMode: autovalidateMode,
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          CustomTextField(hintText: S.of(context).emailAddress, controller: email),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: password,
                            hintText: S.of(context).password,
                            obscureText: !isPasswordVisible,
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
                          SizedBox(height: 24.h),
                          Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouteNames.forgotPassword,
                                );
                              },
                              child: Text(
                                S.of(context).forgotPasswordQuestion,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          CustomButton(
                            buttonName: S.of(context).login,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await context.read<SigninCubit>().call(
                                  email: email.text,
                                  password: password.text,
                                );
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
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
