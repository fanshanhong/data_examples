import 'package:flutter/material.dart';

// 泛型的, 实质也是一个 InheritedWidget
class InheritedProvider<T> extends InheritedWidget {
  final T inheritedData;  

  InheritedProvider({
    Widget child,
    this.inheritedData,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) =>
      inheritedData != oldWidget.inheritedData;

  static T of<T>(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(InheritedProvider<T>().runtimeType)
              as InheritedProvider<T>)
          .inheritedData;
}