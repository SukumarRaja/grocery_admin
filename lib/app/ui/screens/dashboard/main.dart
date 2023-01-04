// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import '../../../config/config.dart';
import '../../../controllers/main.dart';
import '../../../routes/app_routes.dart';
import '../../themes/colors.dart';
import '../../themes/font_size.dart';
import '../../widgets/common_text.dart';
import '../categories/categories.dart';
import '../customer/customers.dart';
import '../deliveryBoy/delivery_boy.dart';
import '../orders/orders.dart';
import '../products/products.dart';
import '../upload_banner.dart';
import '../vendors/vendors.dart';
import '../withdrawal.dart';
import 'dashboard.dart';

class MainDashboard extends StatelessWidget {
  MainDashboard({Key? key}) : super(key: key);

  List<Widget> pages = [
    Dashboard(),
    Vendors(),
    Withdrawal(),
    Orders(),
    Customers(),
    DeliveryBoys(),
    Categories(),
    Products(),
    UploadBanners()
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: CommonText(
          text: "Grocery Admin",
          fontSize: AppFontSize.six,
          fontColor: AppColors.white,
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    color: AppColors.grey.withOpacity(.5),
                    spreadRadius: 1,
                    blurRadius: 2)
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConfig.profile),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications),
          Icon(Icons.more_vert),
        ],
      ),
      sideBar: SideBar(
        activeIconColor: Colors.red,
        textStyle: TextStyle(color: AppColors.primary,fontFamily: "Oswald"),
        items: [
          AdminMenuItem(
              title: "Dashboard",
              icon: Icons.dashboard,
              route: AppRoutes.dashboard),
          AdminMenuItem(
              title: "Vendors", icon: Icons.person, route: AppRoutes.vendors),
          AdminMenuItem(
              title: "Withdrawal",
              icon: Icons.money_rounded,
              route: AppRoutes.withdrawal),
          AdminMenuItem(
              title: "Orders",
              icon: Icons.shopping_cart,
              route: AppRoutes.orders),
          AdminMenuItem(
              title: "Customers",
              icon: Icons.person,
              route: AppRoutes.customers),
          AdminMenuItem(
              title: "Delivery Man",
              icon: Icons.delivery_dining,
              route: AppRoutes.deliveryBoys),
          AdminMenuItem(
              title: "Categories",
              icon: Icons.category,
              route: AppRoutes.categories),
          AdminMenuItem(
              title: "Products", icon: Icons.shop, route: AppRoutes.products),
          AdminMenuItem(
              title: "Upload Banners",
              icon: Icons.upload,
              route: AppRoutes.uploadBanners),
        ],
        selectedRoute: "",
        onSelected: (data) {
          if (data.route == "/Dashboard") {
            MainController.to.selectPageIndex = 0;
          } else if (data.route == "/Vendors") {
            MainController.to.selectPageIndex = 1;
          } else if (data.route == "/Withdrawal") {
            MainController.to.selectPageIndex = 2;
          } else if (data.route == "/Orders") {
            MainController.to.selectPageIndex = 3;
          } else if (data.route == "/Customers") {
            MainController.to.selectPageIndex = 4;
          } else if (data.route == "/DeliveryBoys") {
            MainController.to.selectPageIndex = 5;
          } else if (data.route == "/Categories") {
            MainController.to.selectPageIndex = 6;
          } else if (data.route == "/Products") {
            MainController.to.selectPageIndex = 7;
          } else if (data.route == "/UploadBanners") {
            MainController.to.selectPageIndex = 8;
          } else {
            MainController.to.selectPageIndex = 0;
          }
          print("data is ${data.route}");
        },
        footer: Container(
          height: 40,
          width: double.infinity,
          color: AppColors.black.withOpacity(.2),
          child: Center(
            child: CommonText(
              text: "Copyright @2022",
              fontSize: AppFontSize.four,
            ),
          ),
        ),
      ),
      body: Obx(() => pages[MainController.to.selectPageIndex]),
    );
  }
}
