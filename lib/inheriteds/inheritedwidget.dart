import 'package:flutter/material.dart';

import '../models/data.dart';

// 实质是一个 InheritedWidget, 里面维护 data 和  child
class InheritedDataProvider extends InheritedWidget {
  final Data data;

  InheritedDataProvider({
    Widget child,
    this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) => data != oldWidget.data;

  static InheritedDataProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedDataProvider);
}
