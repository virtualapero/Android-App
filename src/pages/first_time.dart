import 'package:flutter/material.dart';

import '../router.dart';

class FirstTimeView extends StatelessWidget {
  const FirstTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: const Text('first'),
          onTap: () => {
            AppRouter.first(),
            Navigator.of(context).pushNamed(AppRouter.mainRoute)
          },
        ),
      ),
    );
  }

}