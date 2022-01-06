import 'package:animations/animations.dart';
import 'package:charity/pages/map.dart';
import 'package:flutter/material.dart';

class MapFAB extends StatelessWidget {
  const MapFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 650),
      tappable: false,
      openBuilder: (context, closedContainer) => const MapPage(),
      closedShape: const CircleBorder(),
      closedColor: const Color(0xFF57b894),
      closedElevation: 6,
      closedBuilder: (context, openContainer) {
        return InkWell(
          customBorder: const CircleBorder(),
          onTap: () => openContainer(),
          child: const SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.map_rounded,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
