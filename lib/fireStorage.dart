import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:firebase_storage/firebase_storage.dart';
class FireStorage{
  static Future uploadImage(String imagePath,String imageName) async {
    File imageFile = File(imagePath);
    try {
      EasyLoading.show(status: 'Uploading Image...');
      await FirebaseStorage.instance.ref('images/$imageName').putFile(
          imageFile);
      EasyLoading.dismiss();
    } on FirebaseException catch(e){
      EasyLoading.showError(e.message!,duration: Duration(seconds: 4));
      EasyLoading.dismiss();
    }

  }
}



