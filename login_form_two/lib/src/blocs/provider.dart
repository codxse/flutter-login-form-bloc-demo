import 'package:flutter/material.dart';
import 'bloc.dart' as b;

class Provider extends InheritedWidget {
  final b.Bloc bloc = b.Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget _) => true;

  static b.Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
