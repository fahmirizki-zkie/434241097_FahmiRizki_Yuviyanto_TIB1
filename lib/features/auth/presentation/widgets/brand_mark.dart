import 'package:flutter/material.dart';

/// TicketFlow splash brand icon.
class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94,
      height: 94,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF565EFF), Color(0xFF3A41CC)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55363EC4),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.confirmation_num_rounded,
                color: Colors.white,
                size: 38,
              ),
            ),
          ),
          Positioned(
            right: -4,
            bottom: -4,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x28000000),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: Color(0xFF4C53E5),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
