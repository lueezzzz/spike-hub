import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';

class WeaponSkinDetails extends StatelessWidget {
  final WeaponSkin skin;

  const WeaponSkinDetails({
    required this.skin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
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
                    height: 200,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 248, 248, 0.05),
                    ),
                    child: skin.displayIcon != null
                        ? Image.network(
                            skin.displayIcon!,
                            fit: BoxFit.contain,
                          )
                        : Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.white70,
                              size: 48,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      skin.displayName?.toUpperCase() ?? 'UNKNOWN SKIN',
                      style: TextStyle(
                        fontFamily: 'DrukWide',
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        letterSpacing: 1.2,
                        color: Color.fromRGBO(248, 248, 248, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
