import 'package:flutter/material.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/views/auth_screen/login_screen.dart';
import 'package:ktechshop/widgets_common/applogo_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  changeScreen(){
    Future.delayed(const Duration(seconds: 3), (){
      Get.to(() => LoginScreen());
    });
  }
  
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)), 
            20.heightBox, 
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(27).white.make(),
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}