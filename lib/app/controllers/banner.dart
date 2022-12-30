import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get to => Get.put(BannerController());
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  uploadBannersToStorage({required image}) async {
    Reference ref = storage.ref().child('Banners').child(pickFileName);
    UploadTask task = ref.putData(image);
    TaskSnapshot snapshot = await task;
    var downLoadUrl = await snapshot.ref.getDownloadURL();
    return downLoadUrl;
  }

  uploadBannersToFirebaseStore() async {
    EasyLoading.show(status: "uploading...");
    if (pickedImage != null) {
      var imageUrl = await uploadBannersToStorage(image: pickedImage);
      await firestore
          .collection('banners')
          .doc(pickFileName)
          .set({"image": imageUrl}).whenComplete(() {
        EasyLoading.dismiss();
        pickedImage = null;
        image = false;
      });
    }
  }
}
