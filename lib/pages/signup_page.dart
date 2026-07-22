import 'package:flutter/material.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/frame_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController ConfirmedPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LogoContainer(
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Image.asset(
                    'assets/images/Container.png',
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          SizedBox(
            height: 375,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Create Your Account',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 20,
                  //     height: 1,
                  //     color: Color(0xFF212529),
                  //   ),
                  // ),
                  // SizedBox(height: 4),
                  // Text(
                  //   'Take the first step toward your career goals.',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 13,
                  //     height: 1,
                  //     color: Color(0xFF212529),
                  //   ),
                  // ),
                  Expanded(
                    child: FormContainer(
                      title: 'Create Your Account',
                      subTitle: 'Take the first step toward your career goals.',
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      FrameContainer(isSelected: true, title: 'Participant'),
                      SizedBox(width: 8),
                      FrameContainer(title: 'Coach'),
                      SizedBox(width: 8),
                      FrameContainer(title: 'Partner'),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      height: 1,
                      color: Color(0xFF212529),
                    ),
                  ),
                  SizedBox(height: 8),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48,
                          child: CustomTextField(
                            controller: email,
                            isPassword: false,
                            field_title: 'Enter your Email',
                          ),
                        ),

                        SizedBox(height: 16),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            height: 1,
                            color: Color(0xFF212529),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 48,
                          child: CustomTextField(
                            controller: password,
                            isPassword: true,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            height: 1,
                            color: Color(0xFF212529),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 48,
                          child: CustomTextField(
                            controller: ConfirmedPassword,
                            isPassword: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            color: Colors.white,
            height: 116,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ButtonContainer(onTap: () {}, text: 'Create your account'),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF5C636A),
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xFF393A6C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
