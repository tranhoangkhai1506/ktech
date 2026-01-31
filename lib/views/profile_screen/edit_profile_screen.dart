import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktechshop/consts/consts.dart';
import 'package:ktechshop/controllers/profile_controller.dart';
import 'package:ktechshop/widgets_common/bg_widget.dart';
import 'package:ktechshop/widgets_common/custom_textfield.dart';
import 'package:ktechshop/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () =>
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      controller.profileImgPath.isEmpty
                          ? Image.asset(
                              imgProfile2,
                              width: 100,

                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                              File(controller.profileImgPath.value),
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.heightBox,
                      ourButton(
                        color: redColor,
                        onPress: () {
                          Get.find<ProfileController>().changeImage(context);
                        },
                        textColor: whiteColor,
                        title: "Change",
                      ),
                      Divider(),
                      20.heightBox,
                      customTextField(
                        controller: controller.nameController,
                        title: name,
                        hint: nameHint,
                        isPass: false,
                      ),
                      // customTextField(
                      //   controller: controller.passController,
                      //   title: password,
                      //   hint: password,
                      //   isPass: true,
                      // ),
                      20.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : SizedBox(
                              width: context.screenWidth - 40,
                              child: ourButton(
                                color: redColor,
                                onPress: () async {
                                  await controller.updateProfile(
                                    name: controller.nameController.text,
                                    password: controller.passController.text,
                                    imgUrl: controller.profileImgPath.isEmpty
                                        ? data['imageUrl']
                                        : null,
                                  );
                                  VxToast.show(context, msg: "Profile Updated");
                                  Get.back();
                                },
                                textColor: whiteColor,
                                title: "Save",
                              ),
                            ),
                    ],
                  ).box.white.shadowSm
                  .padding(EdgeInsetsGeometry.all(16))
                  .margin(EdgeInsetsGeometry.only(top: 50, left: 12, right: 12))
                  .rounded
                  .make(),
        ),
      ),
    );
  }
}
