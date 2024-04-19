// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:order_tracker/constants/app_padding.dart';
import 'package:order_tracker/helpers/helper_function.dart';
import 'package:order_tracker/theme/text_style.dart';
import 'package:order_tracker/widget/border_container.dart';
import 'package:order_tracker/widget/order_items.dart';
import 'package:order_tracker/widget/order_progress.dart';

class OrderDetails extends StatelessWidget {
  final Color? color;
  final double? opacity;
  final String orderId;
  OrderDetails({this.color, super.key, this.opacity, required this.orderId});
  var year = (DateTime.now().year).toString();
  var day = (DateTime.now().day).toString();
  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      containerOpacity: opacity,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Chicken and Chips", style: header),
          Gap(tweleve),
          OrderProgressWidget(
            orderId: orderId,
          ),
          Gap(tweleve),
          const OrderItems(
            title: "Order ID",
            itemTag: "#1234",
          ),
          Gap(eight),
          OrderItems(
            title: "Order Date",
            itemTag:
                "${getDay(DateTime.now())}, ${getDateMonth(DateTime.now())}$day, $year",
          ),
          Gap(eight),
          const OrderItems(
            title: "Order Type",
            itemTag: "Instant",
          ),
          Gap(eight),
          const OrderItems(
            title: "Order Quantity",
            itemTag: "Great",
          ),
          Gap(eight),
          const OrderItems(
            isPrice: true,
            title: "Order Price",
            itemTag: "9,000",
          )
        ],
      ),
    );
  }
}
