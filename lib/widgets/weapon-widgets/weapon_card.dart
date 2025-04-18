import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_details.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_skins_bottom_sheet.dart';

class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  final int index;

  const WeaponCard({required this.weapon, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return WeaponSkinsBottomSheet(
                  weapon: weapon, scrollController: scrollController);
            },
          ),
        );
      },
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return WeaponDetails(
                weapon: weapon,
                scrollController: scrollController,
              );
            },
          ),
        );
      },
      child: SizedBox(
        width: 100,
        height: 140,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 15,
                left: 15,
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  color: Color.fromRGBO(15, 25, 35, 0.5),
                  shape: BeveledRectangleBorder(
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
              bottom: 20,
              left: 25,
              child: Text(
                weapon.displayName!.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'AkiraExpanded',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.2,
                  color: Color.fromRGBO(248, 248, 248, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
