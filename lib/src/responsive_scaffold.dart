import 'package:flutter/material.dart';
import 'package:responsive_one/src/breakpoints.dart';
import 'package:responsive_one/src/responsive_widget.dart';

// A [Scaffold] that adapt itself based on current breakpoint
class ResponsiveScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? drawer;
  final Widget? tabletDrawer;
  final Widget body;
  final Color color;
  final bool fullScreen;
  final double elevation;

  const ResponsiveScaffold(
      {Key? key,
      required this.appBar,
      this.title,
      this.fullScreen = false,
      this.actions,
      this.drawer,
      this.tabletDrawer,
      required this.body,
      this.elevation = 0,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      large: Scaffold(
          appBar: fullScreen
              ? appBar
              : PreferredSize(
                  preferredSize:
                      Size(Breakpoints.instance.desktop, kToolbarHeight),
                  child: Container(
                    color: color,
                    child: Center(
                        child: SizedBox(
                            width: Breakpoints.instance.desktop,
                            child: appBar)),
                  )),
          body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: fullScreen ? MediaQuery.of(context).size.width : Breakpoints.instance.desktop,
                    child: drawer != null
                        ? Row(
                            children: <Widget>[drawer!, Expanded(child: body)],
                          )
                        : body
                )
              ])),
      medium: Scaffold(
          appBar: appBar,
          body: tabletDrawer != null 
          ? Row(
                  children: <Widget>[
                    SizedBox(
                      width: kToolbarHeight,
                      child: tabletDrawer!
                    ), 
                    Expanded(child: body)
                  ],
                )
          
          : drawer != null
              ? Row(
                  children: <Widget>[
                    drawer!,
                    Expanded(child: body)
                  ],
                )
              : body),
      small: Scaffold(appBar: appBar, drawer: drawer, body: body),
    );
  }
}
