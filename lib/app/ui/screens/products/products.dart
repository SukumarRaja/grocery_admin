import 'package:flutter/material.dart';
import 'package:grocery_admin/app/ui/themes/font_size.dart';

import '../../themes/colors.dart';
import '../../widgets/common_text.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
            child: CommonText(
              text: "Manage Products",
              fontSize: AppFontSize.eight,
            ),
          ),
          Row(
            children: [
              buildExpanded(name: "Image", flex: 1),
              buildExpanded(name: "Name", flex: 3),
              buildExpanded(name: "Price", flex: 2),
              buildExpanded(name: "Quantity", flex: 2),
              buildExpanded(name: "Action", flex: 1),
              buildExpanded(name: "View More", flex: 1),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildExpanded({required name, required flex}) {
    return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey.withOpacity(.2)),
              color: AppColors.primary),
          child: CommonText(
            text: name,
            fontSize: AppFontSize.four,
            fontColor: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
