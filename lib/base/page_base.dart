import 'package:flutter/material.dart';

abstract class PageWidget extends StatelessWidget {
  const PageWidget({super.key});

  Widget widgetBody(BuildContext context, Size size);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return widgetBody(context, size);
  }
}
