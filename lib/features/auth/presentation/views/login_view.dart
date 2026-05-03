import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login View')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 100.h),

            CustomTextField(hintText: 'email'),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
            ),

            SizedBox(height: 70.h),
            CustomButton(buttonName: 'Login', onPressed: () {}),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: Text('forget password'),
            ),
          ],
        ),
      ),
    );
  }
}
