import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    this.width = 2,
    this.aspectRetio = 1.02,

    required this.onPress,
    required this.id,
    required this.titulo,
    required this.icon,
  });

  final double width, aspectRetio;
  final VoidCallback onPress;
  final String titulo, icon;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 150, 150, 150),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.string(
                  icon,
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(18, 83, 196, 1),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
