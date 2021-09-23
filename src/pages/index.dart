import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: const Text('Home'),
          onTap: () => {
            Navigator.of(context).pushNamed('asd')
          },
        ),
      ),
    );
  }

}