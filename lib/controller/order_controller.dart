// ignore_for_file: constant_identifier_names

import 'package:ably_flutter/ably_flutter.dart';
import 'package:get/get.dart';
import 'package:order_tracker/constants/global_variables.dart';

class OrderController extends GetxController {
  final String orderId;

  OrderController({required this.orderId});
  OrderStatus orderStatus = OrderStatus.order_placed;
  @override
  void onInit() {
    initAbly();
    super.onInit();
  }

  void initAbly() async {
    final clientOptions = ClientOptions(key: ablySecKey);

    Realtime realtime = Realtime(options: clientOptions);
    realtime.connection
        .on()
        .listen((ConnectionStateChange stateChange) async {});
    RealtimeChannel channel = realtime.channels.get(orderId);

    channel.on().listen((ChannelStateChange stateChange) async {});
    channel.subscribe().listen((Message message) {
      String event =
          message.name!.toString().replaceAll(" ", "_").toUpperCase();
      var value = OrderStatus.values
          .firstWhereOrNull((element) => element.name.toUpperCase() == event);
      if (value != null) {
        orderStatus = value;
        update();
      }
    });
  }
}

enum OrderStatus {
  order_placed,
  order_accepted,
  order_pick_up_in_progress,
  order_on_the_way_to_customer,
  order_arrived,
  order_delivered
}
