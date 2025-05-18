// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}


class _SplashScreenUIState extends State<SplashScreenUI> {

  @override
  void initState() {
    //  โค้ดดีเลยืหน้าจอไว้3วิแล้วไปหน้า input
    Future.delayed(
      //ระยะเวลา
      Duration(seconds: 3),
      //ครบเวลาแล้วทำอะไร
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputScreenUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img01.png",
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Car Installment',
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              "Calculator",
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightGreenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 40,
              ),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            Text(
              'Created by Tanatorn DTI-SAU',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
