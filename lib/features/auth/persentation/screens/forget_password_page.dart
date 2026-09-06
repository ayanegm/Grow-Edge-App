import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/auth/data/models/reset_password_model.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/otp_reset_password_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/otp_verification_page.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:http/http.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController email = TextEditingController();

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
                    title: 'Forgot Password ?',
                    subTitle: 'Enter your email to reset your password.',
                  ),

                  SizedBox(height: 24),
                  LabeledTextField(
                    title: 'Email',
                    controller: email,
                    hintText: 'Enter your Email',
                    isPassword: false,
                  ),
                  SizedBox(height: 173),
                ],
              ),
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                final responseData = state.data;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OtpResetPasswordPage(
                        resetPasswordModel: ResetPasswordModel(
                          email: email.text,
                          token: responseData?['token'],
                          otp: responseData?['otp'].toString(),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is AuthFailureState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            builder: (context, state) {
              if (state is AuthLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return ButtonContainer(
                text: 'Send Reset Link',
                onTap: () {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).forgetPassword(email: email.text);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
