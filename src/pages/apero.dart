import 'package:flutter/material.dart';

import '../dependencies.dart';
import '../services/aperos.dart';
import '../sturcturs/apero.dart';

class AperoView extends StatefulWidget {
  final String? id;
  const AperoView({Key? key, this.id}) : super(key: key);

  @override
  State<AperoView> createState() => _AperoView(this.id);
}
class _AperoView extends State<AperoView> {
  final String? id;
   Apero? apero;
  _AperoView(this.id);

  @override
  void initState() {
    apero = dependencies<AperosService>().apero(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(apero == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error!"), //TODO
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${apero?.title} (${apero?.date.day}.${apero?.date.month}.${apero?.date.year})"),
      ),
      body: Column(
        children: [
          Text("${apero?.member}"),
          Text("${apero?.content}")
        ],
      )
    );
  }
}
