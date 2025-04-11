import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/gears.dart';

class GearCard extends StatelessWidget {
  final Gear gear;
  final int index;
  const GearCard({required this.gear, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const AgentDetails())
      //   )
      // },
      child: SizedBox(
        width: 120,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(gear.displayIcon!))),
            )
          ],
        ),
      ),
    );
  }
}
