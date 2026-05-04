import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSigninForm extends StatefulWidget {
  const CustomSigninForm({super.key});

  @override
  State<CustomSigninForm> createState() => _CustomSigninFormState();
}

class _CustomSigninFormState extends State<CustomSigninForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          SizedBox(height: 100.h),

          CustomTextField(
            hintText: 'email',
            onSaved: (value) {
              email = value;
            },
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            onSaved: (value) {
              password = value;
            },
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
                formKey.currentState!.save();

                await context.read<SigninCubit>().call(
                  email: email!,
                  password: password!,
                );
              }
            },
          ),
          SizedBox(height: 10),
          Align(alignment: Alignment.topRight, child: Text('forget password')),
        ],
      ),
    );
  }
}
