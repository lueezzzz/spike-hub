import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/maps.dart';

class MapCard extends StatelessWidget {
  MapCard({Key? key, required this.map, required this.index}) : super(key: key);

  Maps map;
  int index;

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(map.listViewIconTall!))),
            )
          ],
        ),
      ),
    );
  }
}
