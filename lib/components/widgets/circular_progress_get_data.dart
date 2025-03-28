import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

// ignore: must_be_immutable
class CircularGetData extends StatefulWidget {
  CircularGetData({super.key, required this.seconds});
  int seconds;
  @override
  State<CircularGetData> createState() => _CircularGetDataState();
}

class _CircularGetDataState extends State<CircularGetData> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(100);

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.aspectRatio(
      aspectRatio: 1, // width ÷ height
      valueNotifier: _valueNotifier,
      progress: 100,
      startAngle: 225,
      sweepAngle: 270,
      foregroundColor: const Color.fromARGB(255, 47, 126, 243),
      backgroundColor: const Color(0xffeeeeee),
      foregroundStrokeWidth: 15,
      backgroundStrokeWidth: 15,
      animation: true,
      seekSize: 6,
      animationDuration: Duration(seconds: widget.seconds),
      seekColor: const Color(0xffeeeeee),
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder:
              (_, double value, __) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${value.toInt()}%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    'Cargando...',
                    style: const TextStyle(
                      color: Color(0xffeeeeee),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
