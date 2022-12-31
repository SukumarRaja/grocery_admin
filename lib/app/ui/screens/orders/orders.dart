import 'package:flutter/material.dart';
import 'package:grocery_admin/app/ui/themes/font_size.dart';

import '../../themes/colors.dart';
import '../../widgets/common_text.dart';
import '../../widgets/main_title_for_pages.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
            child: CommonText(
              text: "Manage Orders",
              fontSize: AppFontSize.eight,
            ),
          ),
          Row(
            children: [
              buildExpanded(name: "Image", flex: 1),
              buildExpanded(name: "Full Name", flex: 3),
              buildExpanded(name: "City", flex: 2),
              buildExpanded(name: "State", flex: 2),
              buildExpanded(name: "Action", flex: 1),
              buildExpanded(name: "View More", flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
