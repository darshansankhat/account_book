import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5),() {
      Get.offAndToNamed("/");
    },);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/s.png",height: 200,width: 200,),
              SizedBox(height: 5.h,),
              Text("Account Book",style: TextStyle(fontSize: 30,color: Colors.green),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: LinearProgressIndicator(backgroundColor: Colors.green.shade100,color: Colors.green,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
