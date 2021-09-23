import 'package:flutter/material.dart';

import '../router.dart';

class FirstTimeView extends StatelessWidget {
  const FirstTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "VirtualApéro",
                    style:
                    TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 52.0,
                ),
                Text("Placeholder Text"),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () =>
                {AppRouter.first(), Navigator.of(context).pushNamed("/")},
                child: Text(
                  "Weiter",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary
                  ),
                ),
              ),
            )
          )
        ],
      )),
    );
  }
}
