import 'package:flutter/material.dart';
import 'package:spike_hub/models/gears.dart';
import 'package:spike_hub/widgets/gear-widgets/gear_details.dart';

class GearDetailsPage extends StatelessWidget {
  final Gear gear;

  const GearDetailsPage({required this.gear, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 70, 86, 1),
      appBar: AppBar(
        title: Text(
          gear.displayName!.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromRGBO(248, 248, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(31, 35, 38, 1),
              Color.fromRGBO(31, 35, 38, 0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: GearDetails(
              gear: gear,
              scrollController: ScrollController(),
            ),
          ),
        ),
      ),
    );
  }
}
