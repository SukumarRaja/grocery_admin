import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin/app/config/config.dart';

import '../themes/colors.dart';
import '../themes/font_size.dart';
import 'common_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
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
                      height: Get.height * 0.135,
                      width: Get.height * 0.135,
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
                          image: NetworkImage("https://cdn.tridge.com/image/original/1d/65/e3/1d65e30bbad30aa96e6048e0d6f8f9ae39164588.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle(text: "Id"),
                        buildTitle(text: "Product Name"),
                        buildTitle(text: "Product Quantity"),
                        buildTitle(text: "Received Date"),
                        buildTitle(text: "Category"),
                        buildTitle(text: "Amount"),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildValue(text: "GR-PRO1"),
                        buildValue(text: "Tomato"),
                        buildValue(text: "15 Kg"),
                        buildValue(text: "10/12/2022"),
                        buildValue(text: "Vegetables"),
                        buildValue(text: "Rs 20 per/kg"),
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
            Positioned(
                left: 10,
                bottom: 2,
                child: Text(
                  "Expiry Date: 12/12/2022",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.black.withOpacity(.7),
                      fontFamily: "Oswald"),
                )),
            // Positioned(
            //   right: 10,
            //   bottom: 4,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       GestureDetector(
            //         onTap: () {},
            //         child: Container(
            //           padding:
            //               EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(6.0),
            //               color: AppColors.primary),
            //           child: Text(
            //             "Action",
            //             style: TextStyle(
            //                 color: AppColors.white,
            //                 fontSize: Get.width * 0.0080,
            //                 fontFamily: "Oswald"),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 5,
            //       )
            //     ],
            //   ),
            // )
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
      ": ${text}".toString().length > 15
          ? ": ${text.substring(0, 10)}..."
          : ": ${text}",
      style: TextStyle(color: AppColors.black, fontFamily: "Oswald"),
    );
  }
}
