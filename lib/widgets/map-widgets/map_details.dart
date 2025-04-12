import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/maps.dart';

class MapDetails extends StatefulWidget {
  final Maps maps;
  final ScrollController scrollController;

  const MapDetails(
      {required this.maps, required this.scrollController, super.key});

  @override
  State<MapDetails> createState() => _MapDetailsState();
}

class _MapDetailsState extends State<MapDetails> {
  @override
  Widget build(BuildContext context) {
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
                color: const Color(0xFF0F1923),
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(widget.maps.splash!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xFF0F1923),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.maps.displayName!.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            getMapDescription(widget.maps.displayName!),
                            style: const TextStyle(
                              color: Colors.white70,
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

  String getMapDescription(String displayName) {
    String mapDisplayName = displayName.toLowerCase();

    switch (mapDisplayName) {
      case "ascent":
        return "Ascent features a center area with two bomb sites on either side. Its vertical playing field with ropes allows for different movement strategies and defensive maneuvers.";
      case "bind":
        return "Bind has two sites connected by one-way teleporters and no middle area. The layout forces players to commit to routes, making map control crucial.";
      case "haven":
        return "Haven is unique with three bomb sites instead of the standard two. This layout creates interesting rotation dynamics and defensive challenges.";
      case "split":
        return "Split is divided by an elevated middle area, with bomb sites at lower elevations. The vertical elements create interesting attacking and defending scenarios.";
      case "icebox":
        return "Icebox is set in a frozen industrial facility with vertical zip lines. Its complex layout offers numerous angles and elevated positions for strategic play.";
      case "breeze":
        return "Breeze features wide open spaces and long sightlines, perfect for long-range engagements. Located on a tropical island with ancient ruins.";
      case "fracture":
        return "Fracture has a unique H-shaped layout with attackers spawning on both sides of the map. The central area connects all major pathways.";
      case "pearl":
        return "Pearl is an underwater city with a traditional three-lane layout. It offers a mix of tight corridors and open areas for varied combat encounters.";
      case "lotus":
        return "Lotus contains three sites with rotating doors and destructible walls. Its intricate layout is inspired by Indian architecture and offers multiple rotational options.";
      case "sunset":
        return "Sunset is set in Los Angeles with colorful streets and a vibrant atmosphere. The map has two sites with interesting mid-control opportunities.";
      default:
        return "Information about this map will be available soon.";
    }
  }
}
