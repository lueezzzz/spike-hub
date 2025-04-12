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
        width: 100,
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: Material(
                color: Color.fromRGBO(255, 70, 86, 1),
                shape: BeveledRectangleBorder(
                  side: BorderSide(
                      color: Color.fromRGBO(15, 25, 35, 1), width: 0.7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Material(
              color: Color.fromRGBO(15, 25, 35, 1),
              shape: BeveledRectangleBorder(
                side:
                    BorderSide(color: Color.fromRGBO(15, 25, 35, 1), width: 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(gear.displayIcon!),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 110,
              child: SizedBox(
                width: 100,
                child: Text(
                  gear.displayName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(15, 25, 35, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
