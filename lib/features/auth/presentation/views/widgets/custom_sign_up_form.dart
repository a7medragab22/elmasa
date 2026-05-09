
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          SizedBox(height: 70),

          CustomTextField(
            hintText: 'name',
            onSaved: (value) {
              name = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'email',
            onSaved: (value) {
              email = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'password',
            onSaved: (value) {
              password = value;
            },
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility),
            ),
          ),

          SizedBox(height: 45),
          CustomButton(
            buttonName: 'Register',
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
