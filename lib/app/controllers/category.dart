import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.put(CategoryController());
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController category = TextEditingController();

  final categoryKey = GlobalKey<FormState>();

  dynamic pickedImage;

  var _image = false.obs;

  get image => _image.value;

  set image(value) {
    _image.value = value;
  }

  var _pickFileName = "".obs;

  get pickFileName => _pickFileName.value;

  set pickFileName(value) {
    _pickFileName.value = value;
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result != null) {
      image = true;
      pickedImage = result.files.first.bytes;
      pickFileName = result.files.first.name;
      update();
    }
  }

  uploadCategoryBannerToStorage({required image}) async {
    Reference ref = storage.ref().child('categoryImages').child(pickFileName);
    UploadTask task = ref.putData(image);
    TaskSnapshot snapshot = await task;
    var downLoadUrl = await snapshot.ref.getDownloadURL();
    return downLoadUrl;
  }

  uploadCategory() async {
    EasyLoading.show(status: "uploading...");
    if (pickedImage != null) {
      var imageUrl = await uploadCategoryBannerToStorage(image: pickedImage);
      await firestore.collection('categories').doc(pickFileName).set(
          {"image": imageUrl, "categoryName": category.text}).whenComplete(() {
        EasyLoading.dismiss();
        pickedImage = null;
        image = false;
        category.text = "";
      });
    }
  }
}
