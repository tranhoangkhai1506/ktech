import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktechshop/consts/consts.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var nameController = TextEditingController();
  var passController = TextEditingController();

  var isLoading = false.obs;
  changeImage(context) async {
    try {
      XFile? img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isLoading(false);
  }
}
