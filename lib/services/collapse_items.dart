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
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'DrukWide',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                letterSpacing: 1.2,
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
