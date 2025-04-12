import 'package:flutter/material.dart';

class CollapseItems extends StatelessWidget {
  final VoidCallback onCollapse;
  final String title;

  const CollapseItems(
      {required this.onCollapse, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
      child: GestureDetector(
        onTap: onCollapse,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_left,
              color: Color.fromRGBO(248, 248, 248, 1),
            ), // or arrow_back
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(248, 248, 248, 1), // You can style it later
              ),
            ),
          ],
        ),
      ),
    );
  }
}
