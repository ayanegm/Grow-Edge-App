import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/auth/data/models/reset_password_model.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/login_page.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/labeled_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/success_widget.dart';

class CreateNewPasswordPage extends StatelessWidget {
  CreateNewPasswordPage({super.key, required this.resetPasswordModel});
  final ResetPasswordModel resetPasswordModel;
  final TextEditingController password = TextEditingController();
  final TextEditingController password_confirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                      title: 'Create New Password',
                      subTitle: 'Choose a new password to secure your account.',
                    ),

                    SizedBox(height: 24),
                    LabeledTextField(
                      title: 'Password',
                      controller: password,
                      hintText: '',
                      isPassword: true,
                    ),
                    LabeledTextField(
                      title: 'Confirm Password',
                      controller: password_confirmation,
                      hintText: '',
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const SuccessWidget(),
                  );
                  Future.delayed(const Duration(milliseconds: 3000), () {
                    if (context.mounted) {
                      Navigator.pop(context); // Close dialog
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    }
                  });
                } else if (state is AuthFailureState) {
                  Navigator.pushReplacement(
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
                    : ButtonContainer(
                        text: 'Send Reset Link',
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).resetPassword(
                            email: resetPasswordModel.email!,
                            otp: resetPasswordModel.otp!,
                            password: password.text,
                            password_confirmation: password_confirmation.text,
                            token: resetPasswordModel.token!,
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
