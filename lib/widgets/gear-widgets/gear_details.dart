import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/gears.dart';
import 'package:spike_hub/widgets/gear-widgets/gear_header.dart';

class GearDetails extends StatefulWidget {
  final Gear gear;
  final ScrollController scrollController;

  const GearDetails(
      {required this.gear, required this.scrollController, super.key});

  @override
  State<GearDetails> createState() => _GearDetailsState();
}

class _GearDetailsState extends State<GearDetails> {
  @override
  Widget build(BuildContext context) {
    final gear = widget.gear;

    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 248, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
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
                      height: 160,
                      color: Color.fromRGBO(15, 25, 35, 1),
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(gear.displayIcon!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GearHeader(gear: gear),
                          const SizedBox(height: 10),
                          Text(
                            gear.description ?? '',
                            style: const TextStyle(
                              color: Color.fromRGBO(31, 35, 38, 1),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
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
