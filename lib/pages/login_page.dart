import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/pages/forget_password_page.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/pages/signup_page.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/widgets/form_container.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LogoContainer(
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Image.asset(
                      'assets/images/Container.png',
                      width: 32,
                      height: 32,
                    ),
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
                  FormContainer(
                    title: 'Welcome Back',
                    subTitle: 'Continue building your future with confidence.',
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
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgetPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                            color: Color(0xFF969FA8),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage(message: 'success');
                            },
                          ),
                        );
                      } else if (state is AuthFailureState) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage(message: state.message);
                            },
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is AuthLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: 'Log In',
                              onTap: () {
                                BlocProvider.of<AuthCubit>(context).login(
                                  email: email.text,
                                  password: password.text,
                                );
                              },
                            );
                    },
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF5C636A),
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignupPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFF393A6C),
                          ),
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
