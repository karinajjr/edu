
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../domain/local/shared/mypref.dart';
import '../../widgets/InputText.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var _controllerName = TextEditingController();

var _controllerPass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/login.png"),
                const SizedBox(height: 64),
                InputText(
                    "Email", TextInputType.text, _controllerName, "", 30),
                const SizedBox(height: 24),
                InputPass(controller: _controllerPass, label: "Password"),
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEB5757),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () {
                        if (isEmailValid(_controllerName.text)) {
                          MySharedPref.setUser(_controllerName.text);
                          MySharedPref.registerUser();
                          Navigator.pushReplacementNamed(context, 'main');
                          _controllerName.clear();
                          _controllerPass.clear();
                        } else {
                          showToast('Data Incorrect!',
                              context: context,
                              animation:
                              StyledToastAnimation.slideFromBottomFade,
                              reverseAnimation:
                              StyledToastAnimation.slideToBottomFade,
                              position: const StyledToastPosition(
                                  align: Alignment.topCenter, offset: 0.0),
                              startOffset: const Offset(0.0, -3.0),
                              reverseEndOffset: const Offset(0.0, -3.0),
                              duration: const Duration(seconds: 4),
                              //Animation duration   animDuration * 2 <= duration
                              animDuration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              reverseCurve: Curves.fastOutSlowIn);
                        }
                      },
                      child: const Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account yet? ',
                      style: TextStyle(
                        color: Color(0xFF8E8E93),
                        fontSize: 14,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                        letterSpacing: -0.41,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Sign up here',
                          style: TextStyle(
                            color: Color(0xFF8E8E93),
                            fontSize: 14,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            height: 0.11,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}

bool isEmailValid(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}
