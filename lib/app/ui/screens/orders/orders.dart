import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin/app/ui/themes/font_size.dart';

import '../../themes/colors.dart';
import '../../widgets/common_text.dart';
import '../../widgets/main_title_for_pages.dart';
import '../../widgets/orders_card.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text("Orders",style: TextStyle(fontFamily: "Oswald",fontSize: Get.width*0.0150),),
              Spacer(),
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                width: Get.width / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.6),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0.2, 0.6))
                    ]),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(fontFamily: "Oswald"),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              itemCount: 25,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return OrdersCard(
                  title: "Vendors",
                  titleCount: "50",
                  icon: Icons.group,
                  since: "month",
                  percentage: "3.48",
                  onPressed: () {},
                );
              }),
        ],
      ),
    );
  }
}
