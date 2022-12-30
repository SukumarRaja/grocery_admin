import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/banner.dart';
import '../themes/colors.dart';
import '../themes/font_size.dart';
import '../widgets/banner_image_card.dart';
import '../widgets/common_text.dart';

class UploadBanners extends StatelessWidget {
  const UploadBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
            child: CommonText(
              text: "Banners",
              fontSize: AppFontSize.eight,
            ),
          ),
          Divider(
            color: AppColors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.grey)),
                      child: Obx(() => BannerController.to.image == true
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.memory(
                                  BannerController.to.pickedImage,
                                  fit: BoxFit.cover),
                            )
                          : Center(
                              child: CommonText(
                              text: "select",
                              fontSize: AppFontSize.six,
                              fontColor: AppColors.grey,
                            ))),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          BannerController.to.pickImage();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        child: CommonText(
                          text: "Upload",
                          fontSize: AppFontSize.four,
                          fontColor: AppColors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    BannerController.to.uploadBannersToFirebaseStore();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  child: CommonText(
                    text: "Save",
                    fontSize: AppFontSize.four,
                    fontColor: AppColors.white,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: AppColors.grey),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(8.0),
            child: CommonText(
              text: "Banners",
              fontSize: AppFontSize.eight,
            ),
          ),
          BannerImageCard()
        ],
      ),
    );
  }
}
