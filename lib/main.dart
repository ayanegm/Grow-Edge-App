import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/auth_cubit/auth_cubit.dart';
import 'package:grow_edge_app/models/user_type_models/participant_model.dart';
import 'package:grow_edge_app/models/user_type_models/startup_model.dart';
import 'package:grow_edge_app/pages/create_new_password_page.dart';
import 'package:grow_edge_app/pages/forget_password_page.dart';
import 'package:grow_edge_app/pages/landing_page.dart.dart';
import 'package:grow_edge_app/pages/login_page.dart';
import 'package:grow_edge_app/pages/otp_verification_page.dart';
import 'package:grow_edge_app/pages/signup_page.dart';
import 'package:grow_edge_app/pages/signup_page/coach/coach_complete_first_signup_page.dart';
import 'package:grow_edge_app/pages/signup_page/coach/complete_signup_coach_second_page.dart';
import 'package:grow_edge_app/pages/signup_page/participant/complete_signup_participant_page.dart';
import 'package:grow_edge_app/pages/signup_page/partner/complete_signup_partner_second_page.dart';
import 'package:grow_edge_app/pages/signup_page/partner/partner_complete_first_signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OtpVerificationPage(email: 'ds', userType: 'ds'),
      ),
    );
  }
}
