import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';

class WeaponSkinsBottomSheet extends StatelessWidget {
  final Weapon weapon;
  final ScrollController scrollController;

  const WeaponSkinsBottomSheet(
      {required this.weapon, required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    final skins = weapon.skins;

    if (skins == null || skins.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(15, 25, 35, 1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'No skins available.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final displaySkins = skins.length >= 9 ? skins.sublist(0, 9) : skins;

    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(15, 25, 35, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(70),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: Color.fromRGBO(15, 25, 35, 1),
                      child: Text(
                        textAlign: TextAlign.center,
                        '${weapon.displayName} Skin'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'DrukWide',
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          letterSpacing: 1.2,
                          color: Color.fromRGBO(248, 248, 248, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 1,
                        ),
                        itemCount: displaySkins.length,
                        itemBuilder: (context, index) {
                          final skin = displaySkins[index];
                          return Material(
                            color: Color.fromRGBO(248, 248, 248, 0.05),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: skin.displayIcon != null
                                        ? Image.network(
                                            skin.displayIcon!,
                                            fit: BoxFit.contain,
                                          )
                                        : Icon(Icons.image_not_supported,
                                            color: Colors.white70),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      skin.displayName ?? 'Unnamed',
                                      style: TextStyle(
                                        fontFamily: 'FuturaCn',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromRGBO(248, 248, 248, 1),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
