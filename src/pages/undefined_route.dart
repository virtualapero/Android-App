import 'package:flutter/material.dart';

class UndefinedRouteView extends StatelessWidget {
  final String? name;
  const UndefinedRouteView({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Undefined Route: $name'),),
    );
  }

}