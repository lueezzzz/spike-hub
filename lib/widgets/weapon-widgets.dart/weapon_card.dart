import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';

class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  final int index;

  const WeaponCard({required this.weapon, required this.index, super.key});

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
        height: 140,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 15,
                left: 15,
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
                    width: 340,
                    height: 120,
                  ),
                )),
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
                width: 300,
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(weapon.displayIcon!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Text(
                weapon.displayName!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
