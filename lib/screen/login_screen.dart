import 'package:flutter/material.dart';
import 'package:food_sns/common/snackbar_util.dart';
import 'package:food_sns/widget/elevated_button_custom.dart';
import 'package:food_sns/widget/section_text.dart';
import 'package:food_sns/widget/text_fields.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                const SizedBox(
                  height: 160,
                ),
                const Center(
                  child: Text(
                    'Food Pick',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 53),
                const SectionText(
                  text: '이메일',
                  textColor: Color(0xff979797),
                ),
                const SizedBox(height: 8),
                TextFormFieldCustom(
                  isPasswordField: false,
                  isReadOnly: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) => inputEmailValidator(value),
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                const SectionText(
                  text: '비밀번호',
                  textColor: Color(0xff979797),
                ),
                const SizedBox(height: 8),
                TextFormFieldCustom(
                  maxLines: 1,
                  isPasswordField: true,
                  isReadOnly: false,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) => inputPasswordValidator(value),
                  controller: _passwordController,
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButtonCustom(
                    text: '로그인',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    onPressed: () async {
                      String emailValue = _emailController.text;
                      String passwordValue = _passwordController.text;

                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      bool isLoginSuccess =
                          await loginWithEmail(emailValue, passwordValue);

                      if (!context.mounted) return;
                      if (!isLoginSuccess) {
                        showSnackBar(context, '로그인을 실패하였습니다.');
                        return;
                      }
                      Navigator.popAndPushNamed(context, '/main');
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButtonCustom(
                    text: '회원가입',
                    backgroundColor: Color(0xff979797),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  inputEmailValidator(value) {
    if (value.isEmpty) {
      return '이메일을 입력해주세요';
    }
    return null;
  }

  inputPasswordValidator(value) {
    if (value.isEmpty) {
      return '비밀번호를 입력해주세요';
    }
    return null;
  }

  Future<bool> loginWithEmail(String emailValue, String passwordValue) async {
    bool isLoginSuccess = false;
    final AuthResponse res = await supabase.auth
        .signInWithPassword(email: emailValue, password: passwordValue);
    if (res.user! != null) {
      isLoginSuccess = true;
    } else {
      isLoginSuccess = false;
    }
    return isLoginSuccess;
  }
}
