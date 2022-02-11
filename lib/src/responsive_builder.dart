import 'package:flutter/material.dart';
import 'package:responsive_one/src/breakpoints.dart';

/// A widget that has a builder function with the actual breakpoint
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext, Breakpoint) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth >= Breakpoints.instance.desktop) {
      return builder(context, Breakpoint.desktop);
    } else if (currentWidth < Breakpoints.instance.desktop &&
        currentWidth >= Breakpoints.instance.mobile) {
      return builder(context, Breakpoint.tablet);
    } else {
      return builder(context, Breakpoint.mobile);
    }
  }
}
