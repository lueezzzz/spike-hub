import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/maps.dart';
import 'package:spike_hub/widgets/map-widgets/map_details.dart';

class MapCard extends StatelessWidget {
  final Maps maps;
  final int index;

  const MapCard({required this.maps, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              return MapDetails(
                maps: maps,
                scrollController: scrollController,
              );
            },
          ),
        );
      },
      child: SizedBox(
        width: 150,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              left: 10,
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Color.fromRGBO(15, 25, 35, 0.5),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                  ),
                ),
                child: SizedBox(
                  width: 350,
                  height: 90,
                ),
              ),
            ),
            Material(
              clipBehavior: Clip.antiAlias,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Container(
                width: 350,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(maps.splash!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Text(
                maps.displayName!.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
