import 'package:flutter/material.dart';
import 'package:food_sns/widget/section_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 160),
                const Center(
                  child: Text(
                    'Food Pick',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 53),
                SectionText(
                  text: '이메일',
                  textColor: const Color(0xff979797),
                ),
                const SizedBox(height: 53),
                SectionText(
                  text: '비밀번호',
                  textColor: const Color(0xff979797),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
