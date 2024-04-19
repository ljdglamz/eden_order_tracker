import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/controller/order_controller.dart';
import 'package:order_tracker/helpers/helper_function.dart';
import 'package:order_tracker/theme/app_colors.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/app_scaffold.dart';
import 'package:order_tracker/widget/border_container.dart';
import 'package:order_tracker/widget/order_details.dart';

class TrackingScreen extends StatefulWidget {
  final String orderId;
  const TrackingScreen({required this.orderId, super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  void initState() {
    Get.put(OrderController(orderId: widget.orderId),
        permanent: true, tag: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: AppColors.white,
          ),
        ),
        title: Text("Tracking",
            style: body.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
        backgroundColor: AppColors.black,
      ),
      body: SafeArea(
        child: GetBuilder<OrderController>(
            tag: widget.orderId,
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(spaceBetween),
                      OrderDetails(
                          orderId: widget.orderId,
                          opacity: 0.03,
                          color: Colors.white.withOpacity(1)),
                      Gap(spaceBetween),
                      Expanded(
                        child: Stepper(
                            currentStep: getCurrentStep(controller.orderStatus),
                            connectorColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            steps: getSteps(controller.orderStatus)),
                      ),
                      Gap(spaceBetween),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  List<Step> getSteps(OrderStatus orderStatus) => [
        Step(
            isActive: false,
            title: Text(
              "Order Placed",
              style: body,
            ),
            content: BorderContainer(
                containerOpacity: 0.03,
                content: Row(
                  children: [
                    Expanded(
                        child: Text("Waiting for vendor to accept your order.",
                            style: body)),
                    Gap(meduimSpaceBetween),
                    Text(getCurrentTime(),
                        textAlign: TextAlign.end, style: body)
                  ],
                ))),
        Step(
            isActive: true,
            title: Text(
              "Order Accepted ",
              style: body,
            ),
            content: BorderContainer(
                containerOpacity: 0.03,
                content: Row(
                  children: [
                    Expanded(
                        child: Text(
                            "Order accepted by vendor and would be delivered soonest.",
                            style: body)),
                    Gap(tweleve),
                    Text(getCurrentTime(),
                        textAlign: TextAlign.end, style: body)
                  ],
                ))),
        Step(
            title: Text(
              "Order pick up in progress ",
              style: body,
            ),
            content: BorderContainer(
                containerOpacity: 0.03,
                content: Row(
                  children: [
                    Expanded(
                        child: Text(
                            "A rider is on the way to pick up your order",
                            style: body)),
                    Gap(tweleve),
                    Text(getCurrentTime(),
                        textAlign: TextAlign.end, style: body)
                  ],
                ))),
        Step(
            title: Text(
              "Order on the way to customer",
              style: body,
            ),
            content: BorderContainer(
                containerOpacity: 0.03,
                content: Row(
                  children: [
                    Expanded(
                        child: Text(
                            "Your order would arrive soonest as the rider is headed your way already.",
                            style: body)),
                    Gap(tweleve),
                    Text(getCurrentTime(),
                        textAlign: TextAlign.end, style: body)
                  ],
                ))),
        Step(
          title: Text(
            "Order arrived",
            style: body,
          ),
          content: BorderContainer(
              containerOpacity: 0.03,
              content: Row(
                children: [
                  Expanded(
                      child: Text(
                          "Order is avaliable for pick up 🥳, please do not keep the rider waiting.",
                          style: body)),
                  Gap(tweleve),
                  Text(getCurrentTime(), textAlign: TextAlign.end, style: body)
                ],
              )),
        ),
        Step(
          title: Text(
            "Order delivered",
            style: body,
          ),
          content: BorderContainer(
              containerOpacity: 0.03,
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("Enjoy 🤗.", style: body)),
                      Gap(tweleve),
                      Text(getCurrentTime(),
                          textAlign: TextAlign.end, style: body)
                    ],
                  ),
                  Image.asset(
                    "assets/rate_us.png",
                    height: 50,
                  )
                ],
              )),
        )
      ];
}
