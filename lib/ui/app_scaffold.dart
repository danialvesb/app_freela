import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class AppFreelaScaffold extends StatelessWidget with GetItMixin {
  AppFreelaScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    //$styles = AppStyle(appSize: null); //Size(context.widthPx, context.heightPx));
    return Stack(
      children: [
        Theme(
          // Provide a default texts style to allow Hero's to render text properly
          data: ThemeData(),
          child: DefaultTextStyle(
            style: TextStyle(),
            // Use a custom scroll behavior across entire app
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: child ?? Container(),
            ),
          ),
        ),
      ],
    );
  }
}
