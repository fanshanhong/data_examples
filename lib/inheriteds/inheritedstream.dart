import 'package:flutter/material.dart';

import 'package:frideos_core/frideos_core.dart';

import '../models/data.dart';

// 实质是InheritedWidget, 里面维护的data 是个Stream
class InheritedStreamedDataProvider extends InheritedWidget {
  final StreamedValue<Data> data;

  InheritedStreamedDataProvider({
    Widget child,
    this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedStreamedDataProvider oldWidget) =>
      data.value != oldWidget.data.value;

  static InheritedStreamedDataProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedStreamedDataProvider);
}

