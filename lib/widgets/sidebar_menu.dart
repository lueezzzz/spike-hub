import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  final String activeTab;
  final Function(String title) onTabSelected;
  final VoidCallback onClose;

  const SidebarMenu({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(15, 25, 35, 1),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ),
            _buildNavItem('HOME'),
            _buildNavItem('AGENTS'),
            _buildNavItem('MAPS'),
            _buildNavItem('WEAPONS'),
            _buildNavItem('GEARS'),
            _buildNavItem('FAVORITES'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    bool isActive = activeTab == title;

    return GestureDetector(
      onTap: () => onTabSelected(title),
      child: Container(
        color: isActive ? Color.fromRGBO(255, 70, 86, 1) : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'DrukWide',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
