import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/auth_cubit/auth_state.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/models/user_type_models/base_user_model.dart';
import 'package:grow_edge_app/models/user_type_models/participant_model.dart';
import 'package:grow_edge_app/models/user_type_models/startup_model.dart';
import 'package:grow_edge_app/pages/home_page.dart';
import 'package:grow_edge_app/pages/otp_verification_page.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';
import 'package:grow_edge_app/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/form_container.dart';
import 'package:grow_edge_app/widgets/frame_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedUserType = 'Participant';
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController password_confirmation = TextEditingController();

  final formKey = GlobalKey<FormState>();
  BaseUserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
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
                        Expanded(
                          child: FormContainer(
                            title: 'Create Your Account',
                            subTitle:
                                'Take the first step toward your career goals.',
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            FrameContainer(
                              onTap: () {
                                setState(() {
                                  selectedUserType = 'Participant';
                                });
                              },
                              isSelected: selectedUserType == 'Participant',
                              title: 'Participant',
                            ),
                            SizedBox(width: 8),
                            FrameContainer(
                              title: 'Coach',
                              onTap: () {
                                setState(() {
                                  selectedUserType = 'Coach';
                                });
                              },
                              isSelected: selectedUserType == 'Coach',
                            ),
                            SizedBox(width: 8),
                            FrameContainer(
                              title: 'Startup',
                              onTap: () {
                                setState(() {
                                  selectedUserType = 'startup';
                                });
                              },
                              isSelected: selectedUserType == 'startup',
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        TextFieldTitle(title: 'Email'),
                        SizedBox(height: 8),
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                controller: email,
                                isPassword: false,
                                hintText: 'Enter your Email',
                              ),

                              SizedBox(height: 16),

                              TextFieldTitle(title: 'Password'),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: password,
                                isPassword: true,
                              ),
                              SizedBox(height: 16),
                              TextFieldTitle(title: 'Confirm Password'),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: password_confirmation,
                                isPassword: true,
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
                        state is AuthLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                onTap: () {
                                  if (selectedUserType == 'Participant') {
                                    userModel = ParticipantModel(
                                      email: email.text,
                                    );
                                  } else if (selectedUserType == 'Coach') {
                                  } else if (selectedUserType == 'Startup') {
                                    userModel = StartupModel(email: email.text);
                                  }
                                  BlocProvider.of<AuthCubit>(context).register(
                                    email: email.text,
                                    password: password.text,
                                    password_confirmation:
                                        password_confirmation.text,
                                    user_type: selectedUserType.toLowerCase(),
                                  );
                                },
                                text: 'Create your account',
                              ),
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
            );
          },
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OtpVerificationPage(
                      email: email.text,
                      userType: selectedUserType,
                    );
                  },
                ),
              );
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
        ),
      ),
    );
  }
}
