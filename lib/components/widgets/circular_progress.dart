import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class CircularProgressPanic extends StatelessWidget {
  const CircularProgressPanic({super.key});

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.square(
      dimensions: 350,
      progress: 360,
      maxProgress: 360,
      startAngle: -27.5,
      foregroundColor: Colors.redAccent,
      backgroundColor: const Color(0xffeeeeee),
      foregroundStrokeWidth: 7,
      backgroundStrokeWidth: 7,
      foregroundGapSize: 5,
      foregroundDashSize: 55,
      backgroundGapSize: 5,
      backgroundDashSize: 55,
      animationDuration: Duration(
        milliseconds: () {
          if (MediaQuery.of(context).size.width < 600) {
            return 50000;
          }
          return 60000;
        }(),
      ),
      animation: true,
      child: const Icon(Icons.favorite, color: Colors.redAccent, size: 126),
    );
  }
}
