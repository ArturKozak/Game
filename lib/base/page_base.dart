import 'package:flutter/material.dart';

abstract class PageWidget extends StatelessWidget {
  const PageWidget({super.key});

  Widget widgetBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return widgetBody(context);
  }
}
