import 'package:flutter/material.dart';
import 'package:responsive_one/src/breakpoints.dart';
import 'package:responsive_one/src/responsive_widget.dart';

class ResponsiveChild extends StatelessWidget {
  final Widget child;
  final bool large;
  final bool medium;

  const ResponsiveChild(
      {required this.child, this.large = true, this.medium = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      large:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
            width: large
                ? Breakpoints.instance.desktop
                : medium
                    ? Breakpoints.instance.tablet
                    : Breakpoints.instance.mobile,
            child: child)
      ]),
      medium:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
            width: medium
                ? Breakpoints.instance.tablet
                : Breakpoints.instance.mobile,
            child: child)
      ]),
      small: child,
    );
  }
}
