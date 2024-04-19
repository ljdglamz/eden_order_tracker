import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/constants/global_variables.dart';
import 'package:order_tracker/controller/order_controller.dart';
import 'package:order_tracker/helpers/helper_function.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/actions.dart';
import 'package:order_tracker/widget/app_scaffold.dart';
import 'package:order_tracker/widget/order_details.dart';
import 'package:order_tracker/screens/dashboard/tracking_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String orderId = "#1234";
  @override
  void initState() {
    Get.put(OrderController(orderId: orderId), permanent: true, tag: orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppScaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
          ),
          preferredSize: Size.zero,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: size.height * 0.74,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(60)),
                    color: AppColors.primaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenPadding),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(meduimSpaceBetween),
                            Text("Order Tracker",
                                style: header.copyWith(fontSize: 20)),
                            Gap(meduimSpaceBetween),
                            Text(
                                "Hello  ${currentUser!.displayName},\n ${currentUser!.email}",
                                textAlign: TextAlign.center,
                                style: body.copyWith()),
                            Gap(meduimSpaceBetween),
                            Text("Place and track an order",
                                style: header.copyWith(fontSize: 18)),
                            Gap(meduimSpaceBetween),
                            Expanded(
                              child: Image.asset(
                                "assets/someone_ordering.png",
                              ),
                            ),
                            Gap(meduimSpaceBetween),
                            Text(
                                "Your would be delivered swiftly, here is an example of what an order looks like",
                                textAlign: TextAlign.center,
                                style: body.copyWith(
                                    color: AppColors.white.withOpacity(0.6))),
                            Gap(meduimSpaceBetween),
                          ],
                        ),
                      ),
                      OrderDetails(
                        orderId: orderId,
                      ),
                      Gap(screenPadding),
                    ],
                  ),
                ),
              ),
              Gap(spaceBetween),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionButtons(
                      text: "Place Order",
                      onTap: () {
                        showAppSnackBar(
                          "Order Placed, Please Proceed to tracking your order 😊.",
                        );
                        return;
                      },
                      image: "assets/order_now.png",
                    ),
                    Gap(tweleve),
                    ActionButtons(
                      text: "Track Order",
                      onTap: () => Get.to(
                          transition: Transition.rightToLeft,
                          () => TrackingScreen(
                                orderId: orderId,
                              )),
                      image: "assets/delivery.png",
                    ),
                    Gap(tweleve),
                    ActionButtons(
                      text: "Rate Us ",
                      onTap: () {
                        showAppSnackBar(
                          "Thank you for choosing us, your satisfaction is our joy 😊.",
                        );
                        return;
                      },
                      image: "assets/rate_us.png",
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
