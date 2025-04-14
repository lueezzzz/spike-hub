import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onMenuToggle;

  const BottomNavbar({
    super.key,
    required this.isOpen,
    required this.onMenuToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(31, 35, 38, 1),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -7),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(248, 248, 248, 1),
                size: 30,
              ),
              onPressed: onMenuToggle,
            ),
          ),
        ],
      ),
    );
  }
}
