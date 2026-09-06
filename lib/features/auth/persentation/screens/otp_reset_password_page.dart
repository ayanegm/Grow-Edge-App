import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/features/auth/persentation/controller/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/controllers.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/create_new_password_page.dart';
import 'package:grow_edge_app/features/auth/data/models/reset_password_model.dart';
import 'package:grow_edge_app/features/auth/data/models/user_type_models/coach_model.dart';
import 'package:grow_edge_app/features/auth/data/models/user_type_models/startup_model.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/complete_signup_page/coach/coach_complete_first_signup_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/complete_signup_page/participant/complete_signup_participant_page.dart';
import 'package:grow_edge_app/features/auth/persentation/screens/complete_signup_page/partner/partner_complete_first_signup_page.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/features/auth/persentation/widgets/text_field_otp.dart';

class OtpResetPasswordPage extends StatelessWidget {
  const OtpResetPasswordPage({super.key, required this.resetPasswordModel});
  final ResetPasswordModel resetPasswordModel;
  @override
  Widget build(BuildContext context) {
    String? otp;
    return Scaffold(
      backgroundColor: AppColors.background,
      // Use Builder here to get a fresh context that is a child of the BlocProvider
      body: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                        title: 'Verify Your Email',
                        subTitle: 'Enter the code sent to your email address.',
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          TextFieldOTP(
                            controller: c1,
                            first: true,
                            last: false,
                          ),
                          SizedBox(width: 8),
                          TextFieldOTP(
                            controller: c2,
                            first: false,
                            last: false,
                          ),
                          SizedBox(width: 8),
                          TextFieldOTP(
                            controller: c3,
                            first: false,
                            last: false,
                          ),
                          SizedBox(width: 8),
                          TextFieldOTP(
                            controller: c4,
                            first: false,
                            last: false,
                          ),
                          SizedBox(width: 8),
                          TextFieldOTP(
                            controller: c5,
                            first: false,
                            last: false,
                          ),
                          SizedBox(width: 8),
                          TextFieldOTP(
                            controller: c6,
                            first: false,
                            last: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Didn\'t receive the code?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Resend',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 121),

                      Container(
                        color: Colors.white,
                        height: 84,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24),
                          child: CustomButton(
                            text: 'Verify Email',
                            onTap: () {
                              otp =
                                  c1.text +
                                  c2.text +
                                  c3.text +
                                  c4.text +
                                  c5.text +
                                  c6.text;
                              print(otp);
                              if (otp == resetPasswordModel.otp) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CreateNewPasswordPage(
                                        resetPasswordModel: resetPasswordModel,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
