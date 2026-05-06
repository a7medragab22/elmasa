import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: ListView(
        children: [
          SizedBox(height: 100.h),

          CustomTextField(hintText: 'email', controller: email),
          SizedBox(height: 20.h),
          CustomTextField(
            controller: password,
            hintText: 'password',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility),
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
                await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: email.text,
                );
              },
              child: Text('forget password'),
            ),
          ),
        ],
      ),
    );
  }
}
