

import 'package:demo/domain/local/shared/mypref.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEB5757),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("edu", style: TextStyle(color: Colors.white),),
            InkWell(
                onTap: (){
                  MySharedPref.unRegisterUser();
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
