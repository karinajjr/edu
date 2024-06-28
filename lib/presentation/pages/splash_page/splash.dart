import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domain/local/shared/mypref.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void> fetchUserOrder() {
      return Future.delayed(const Duration(seconds: 2), () {

        if(MySharedPref.isRegistered() == true){
          Navigator.pushReplacementNamed(context, 'main');
        } else {
          Navigator.pushReplacementNamed(context, 'login');
        }
      });
    }

    fetchUserOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/splash.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoadingAnimationWidget.hexagonDots(
                  color: Colors.red,
                  size: 36,
                ),
                const SizedBox(height: 40)
              ],
            )
          ],
        ),
      ),
    );
  }
}


