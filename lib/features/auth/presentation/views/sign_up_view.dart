import 'package:elmasa/core/utils/widgets/custom_text_field.dart';
import 'package:elmasa/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp View')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            SizedBox(height: 70),

            CustomTextField(hintText: 'name'),
            SizedBox(height: 16),
            CustomTextField(hintText: 'email'),
            SizedBox(height: 16),
            CustomTextField(
              hintText: 'password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
            ),

            SizedBox(height: 45),
            CustomButton(buttonName: 'Register', onPressed: () {}),
            SizedBox(height: 20),

            // Align(
            //   alignment: Alignment.topRight,
            //   child: Text('forget password ?'),
            // ),
          ],
        ),
      ),
    );
  }
}
