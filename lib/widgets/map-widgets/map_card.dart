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
        width: 150,
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 15,
                left: 10,
                child: Material(
                    clipBehavior: Clip.antiAlias,
                    shape: BeveledRectangleBorder(
                      side: BorderSide(
                          color: Color.fromRGBO(15, 25, 35, 1), width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                      ),
                    ),
                    child: Container(
                      color: Color.fromRGBO(15, 25, 35, 1),
                      width: 350,
                      height: 100,
                    ))),
            Material(
              clipBehavior: Clip.antiAlias,
              shape: BeveledRectangleBorder(
                side:
                    BorderSide(color: Color.fromRGBO(15, 25, 35, 1), width: 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(map.listViewIcon!),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Text(
                'Map',
                style: TextStyle(
                    color: Color.fromRGBO(248, 248, 248, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
