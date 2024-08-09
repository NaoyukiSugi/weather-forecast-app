import 'dart:async';
import 'package:flutter/material.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) {
        afterFirstLayout();
      }),
    );
  }

  void afterFirstLayout();
}
