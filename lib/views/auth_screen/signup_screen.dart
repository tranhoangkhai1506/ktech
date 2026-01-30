import 'package:flutter/material.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/controllers/auth_controller.dart';
import 'package:ktechshop/views/home_screen/home.dart';
import 'package:ktechshop/widgets_common/applogo_widget.dart';
import 'package:ktechshop/widgets_common/bg_widget.dart';
import 'package:ktechshop/widgets_common/custom_textfield.dart';
import 'package:ktechshop/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var passRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              20.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                    children: [
                      customTextField(
                        title: name,
                        hint: nameHint,
                        controller: nameController,
                        isPass: false,
                      ),
                      customTextField(
                        title: email,
                        hint: emailHint,
                        controller: emailController,
                        isPass: false,
                      ),
                      customTextField(
                        title: password,
                        hint: passwordHint,
                        controller: passController,
                        isPass: true,
                      ),
                      customTextField(
                        title: retypePass,
                        hint: passwordHint,
                        controller: passRetypeController,
                        isPass: true,
                      ),
                      5.heightBox,

                      Row(
                        children: [
                          Checkbox(
                            checkColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.heightBox,

                      ourButton(
                        color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () async {
                          if (isCheck != false) {
                            try {
                              await controller
                                  .signMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passController.text,
                                  )
                                  .then((value) {
                                    return controller.storeUserData(
                                      email: emailController.text,
                                      password: passController.text,
                                      name: nameController.text,
                                    );
                                  })
                                  .then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => Home());
                                  });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                            }
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: login,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        Get.back();
                      }),
                    ],
                  ).box.white.rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
