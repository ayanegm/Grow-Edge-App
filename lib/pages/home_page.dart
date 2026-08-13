import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.amber, body: Text(message));
  }
}
