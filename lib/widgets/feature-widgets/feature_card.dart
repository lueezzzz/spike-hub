import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String feature;

  const FeatureCard({
    super.key,
    required this.title,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: Color.fromRGBO(15, 25, 35, 0.8),
        width: 280,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'DrukWide',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 1.2,
                      color: Color.fromRGBO(255, 70, 86, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    feature,
                    style: const TextStyle(
                      fontFamily: 'FuturaCn',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromRGBO(248, 248, 248, 1),
                      height: 1.3,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
