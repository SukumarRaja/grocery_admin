import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common_text.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
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
        height: 100,
        width: Get.width / 6.1,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            // border: Border.all(color: AppColors.primary,width: 2),
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0.2, 0.3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: title,
                      fontSize: AppFontSize.six,
                      fontColor: AppColors.black.withOpacity(.6),
                    ),
                    SizedBox(height: 8),
                    CommonText(
                      text: titleCount,
                      fontSize: AppFontSize.six * 1,
                      fontColor: AppColors.primary,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0.2, 0.4))
                        ]),
                    child: Icon(
                      icon,
                      size: 35,
                    )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_upward_outlined,
                    color: AppColors.green,
                    size: 14,
                  ),
                  CommonText(
                    text: "${percentage} %",
                    fontSize: AppFontSize.four,
                    fontColor: AppColors.green,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CommonText(
                    text: "Since last ${since}",
                    fontSize: AppFontSize.four,
                    fontColor: AppColors.black.withOpacity(.4),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
