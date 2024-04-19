import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker/controller/order_controller.dart';
import 'package:order_tracker/theme/app_colors.dart';

String getDay(DateTime dateTime, {String? day}) {
  final DateFormat format1 = DateFormat('EEE');
  return format1.format(dateTime);
}

String getDateMonth(DateTime dateTime, {String? day}) {
  final DateFormat format1 = DateFormat('MMM');
  return format1.format(dateTime);
}

void showAppSnackBar(String message,
    {String title = "Message", Duration? duration}) {
  Get.snackbar(
      backgroundColor: AppColors.white,
      title,
      message,
      duration: duration ?? const Duration(seconds: 5));
}

int getCurrentStep(OrderStatus orderStatus) {
  if (orderStatus == OrderStatus.order_placed) {
    return 0;
  }
  if (orderStatus == OrderStatus.order_accepted) {
    return 1;
  }
  if (orderStatus == OrderStatus.order_pick_up_in_progress) {
    return 2;
  }
  if (orderStatus == OrderStatus.order_on_the_way_to_customer) {
    return 3;
  }
  if (orderStatus == OrderStatus.order_arrived) {
    return 4;
  }
  if (orderStatus == OrderStatus.order_delivered) {
    return 5;
  }
  return 0;
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String period = now.hour >= 12 ? 'PM' : 'AM';
  int hour = now.hour > 12
      ? now.hour - 12
      : now.hour == 0
          ? 12
          : now.hour;
  String formattedTime =
      "${hour}:${now.minute.toString().padLeft(2, '0')} $period";
  return formattedTime;
}
