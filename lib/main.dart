import 'package:flutter/material.dart';
import 'package:grow_edge_app/pages/landing_page.dart.dart';
import 'package:grow_edge_app/pages/login_page.dart';
import 'package:grow_edge_app/pages/otp_authentication_page.dart';
import 'package:grow_edge_app/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LandingPage(), debugShowCheckedModeBanner: false);
  }
}
