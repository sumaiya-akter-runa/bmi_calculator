import 'dart:async';

import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //function for set timer
  startTimer() async{
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BMICalculator()));//for going one page to another page
      //after 5sec
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //call a function
    startTimer();//call a function
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/img.png",
              width: 200,
              height: 200 ,),

            SizedBox(height: 10,),//gap between logo and text

            Text("Body Mass Index" , style: GoogleFonts.acme(
                fontSize:30,
                fontWeight:FontWeight.bold,
                color: Color(0xFFA0522D)
            ),),
            SizedBox(height: 10,),
            CircularProgressIndicator(
              color: Color(0xFFA0522D),
            )
          ],
        ),
      ),
    );
  }
}
