import 'package:flutter/material.dart';
import '../../themes/font_size.dart';
import '../../widgets/common_text.dart';
import '../../widgets/main_title_for_pages.dart';

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
}
