import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/category.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/category_image_card.dart';
import '../../widgets/common_text.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
            child: CommonText(
              text: "Category",
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
                      child: Obx(() => CategoryController.to.image == true
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.memory(
                                  CategoryController.to.pickedImage,
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
                          CategoryController.to.pickImage();
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
              Form(
                key: CategoryController.to.categoryKey,
                child: Flexible(
                  child: SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: CategoryController.to.category,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Please enter category name";
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(hintText: "Enter category name"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (CategoryController.to.categoryKey.currentState!
                        .validate()) {
                      CategoryController.to.uploadCategory();
                    }
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
              text: "Categories",
              fontSize: AppFontSize.eight,
            ),
          ),

          CategoryImageCard()
        ],
      ),
    );
  }
}
