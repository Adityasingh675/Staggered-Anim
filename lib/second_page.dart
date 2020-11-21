import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  final Animation<double> transitionAnimation;
  SecondPage({Key key, this.transitionAnimation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SlidingContainer(
              initialOffsetX: 1,
              intervalEnd: 0.5,
              intervalStart: 0,
              color: Colors.red,
            ),
          ),
          Expanded(
              child: SlidingContainer(
                  color: Colors.purple,
                  initialOffsetX: -1,
                  intervalEnd: 1,
                  intervalStart: 0.5)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Text("Navigate Back"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SlidingContainer extends StatelessWidget {
  final double initialOffsetX;
  final double intervalStart;
  final double intervalEnd;
  final Color color;
  const SlidingContainer(
      {Key key,
      @required this.color,
      @required this.initialOffsetX,
      @required this.intervalEnd,
      @required this.intervalStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(initialOffsetX, 0), end: Offset(0, 0))
                  .animate(
            CurvedAnimation(
                curve: Interval(intervalStart, intervalEnd,
                    curve: Curves.easeOutCubic),
                parent: animation),
          ),
          child: child,
        );
      },
      child: Container(color: color),
    );
  }
}
