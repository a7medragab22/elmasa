import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSigninForm extends StatefulWidget {
  const CustomSigninForm({super.key});

  @override
  State<CustomSigninForm> createState() => _CustomSigninFormState();
}

class _CustomSigninFormState extends State<CustomSigninForm> {
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
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 40.h),

                CustomTextField(
                  hintText: 'Email',
                  controller: email,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: password,
                  hintText: 'Password',
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

                SizedBox(height: 70.h),
                CustomButton(
                  buttonName: 'Login',
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
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () async {
                      if (email.text.isNotEmpty) {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email.text,
                        );
                      }
                    },
                    child: Text('Forgot Password?'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
