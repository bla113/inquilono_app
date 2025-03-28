import 'package:codominio_app/constants/icons.svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmergencyContactItem extends StatelessWidget {
  final String icon;
  final String label;

  const EmergencyContactItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(16, 16, 16, 0.2),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: SvgPicture.string(alertIconInactive),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2F2F2F),
                fontFamily: 'Satoshi',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
