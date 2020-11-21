import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_anim/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return ListenableProvider(
                  create: (context) => animation,
                  child: SecondPage(),
                );
              },
              transitionDuration: Duration(seconds: 1),
            ),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
