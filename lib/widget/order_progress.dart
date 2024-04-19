import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/controller/order_controller.dart';
import 'package:order_tracker/helpers/helper_function.dart';

class OrderProgressWidget extends StatelessWidget {
  final String orderId;
  const OrderProgressWidget({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        tag: orderId,
        builder: (controller) {
          return Row(
            children: [
              for (int x = 0; x < 6; x++)
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    height: 4,
                    decoration: BoxDecoration(
                        color: getCurrentStep(controller.orderStatus) >= x
                            ? Colors.white
                            : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                )
            ],
          );
        });
  }
}
