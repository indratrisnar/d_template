import 'package:d_template/d_template.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: DTLogin(
            edtEmail: TextEditingController(),
            edtPassword: TextEditingController(),
            colorInputBackground: Colors.grey[300]!,
            btnLoginAlign: 'start',
            btnLoginWidth: 150,
            btnLoginOnTap: () {
              print('login tapped');
            },
          ),
        ),
      ),
    );
  }
}
