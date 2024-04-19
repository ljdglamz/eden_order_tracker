import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottom;
  final Color color;
  const AppScaffold(
      {this.color = const Color(0x0ff10340),
      this.bottom,
      required this.body,
      this.appBar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: color,
            body: body,
            appBar: appBar,
            bottomNavigationBar: bottom));
  }
}
