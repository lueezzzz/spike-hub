import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';

class FavoriteCard extends StatelessWidget {
  final Agent agent;
  final VoidCallback onRemove;

  const FavoriteCard({required this.agent, required this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Color.fromRGBO(15, 25, 35, 0.5),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: SizedBox(
                width: 100,
                height: 100,
              ),
            ),
          ),
          Material(
            color: Color.fromRGBO(15, 25, 35, 1),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: agent.displayIcon!,
              height: 100,
            ),
          ),
          Positioned(
            top: -7,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Color.fromRGBO(255, 70, 86, 1),
              ),
              onPressed: onRemove,
            ),
          ),
          Positioned(
            top: 110,
            child: SizedBox(
              width: 100,
              child: Text(
                agent.displayName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(15, 25, 35, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
