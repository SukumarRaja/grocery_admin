import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin/app/config/config.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common_text.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard(
      {Key? key,
        required this.onPressed,
        required this.title,
        required this.titleCount,
        required this.percentage,
        required this.since,
        required this.icon})
      : super(key: key);
  final Function() onPressed;
  final String title;
  final String titleCount;
  final String percentage;
  final String since;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0.2, 0.3))
            ]),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: Get.height * 0.100,
                      width: Get.height * 0.100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0.2, 0.3))
                        ],
                        image: DecorationImage(
                          image: NetworkImage(AppConfig.profile),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle(text: "Name"),
                        buildTitle(text: "Email"),
                        buildTitle(text: "Phone"),
                        buildTitle(text: "Address"),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildValue(text: "Testname"),
                        buildValue(text: "test@gmail.com"),
                        buildValue(text: "1234567891"),
                        buildValue(text: "Namakkal"),
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 6,right: 6,top: 2,bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.grey),
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: "Oswald",
                            fontSize: Get.width * 0.0080,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 6,right: 6,top: 2,bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.primary),
                        child: Text(
                          "Action",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: Get.width * 0.0080,
                              fontFamily: "Oswald"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ],
            ),
            Positioned(
                left: 10,
                bottom: 8,
                child: Text(
                  "Since 3 month",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.black.withOpacity(.5),
                      fontFamily: "Oswald"),
                ))
          ],
        ),
      ),
    );
  }

  Text buildTitle({required String text}) {
    return Text(
      text,
      style: TextStyle(fontFamily: "Oswald"),
    );
  }

  Text buildValue({required String text}) {
    return Text(
      ": ${text}".toString().length > 12
          ? ": ${text.substring(0, 8)}..."
          : ": ${text}",
      style: TextStyle(color: AppColors.black, fontFamily: "Oswald"),
    );
  }
}
