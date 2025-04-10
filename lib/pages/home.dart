import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/search/search_item.dart';
import 'package:spike_hub/widgets/tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showAll = false;
  bool isSideMenuOpen = false;
  String activeTab = 'HOME';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 86, 1),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (isSideMenuOpen) {
                setState(() {
                  isSideMenuOpen = false;
                });
              }
            },
            child: SafeArea(
              child: Column(
                children: [
                  SearchItem(),
                  if (!showAll)
                    Container(
                      height: 275,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(31, 35, 38, 1),
                            Color.fromRGBO(31, 35, 38, 0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: Tabs(
                      showAll: showAll,
                      onSeeAllChanged: (value) {
                        setState(() {
                          showAll = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Side menu
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            right: isSideMenuOpen ? 0 : -200,
            top: 0,
            bottom: 0,
            width: 200,
            child: GestureDetector(
              child: Container(
                color: Color.fromRGBO(31, 35, 38, 1),
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              isSideMenuOpen = false;
                            });
                          },
                        ),
                      ),
                      buildNavItem('HOME'),
                      buildNavItem('AGENTS'),
                      buildNavItem('MAPS'),
                      buildNavItem('WEAPONS'),
                      buildNavItem('GEARS'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(31, 35, 38, 1),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7.0, left: 10.0),
              child: Container(
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/valorant-logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(248, 248, 248, 1),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  isSideMenuOpen = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String title) {
    bool isActive = activeTab == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = title;
          isSideMenuOpen = false;
        });
      },
      child: Container(
        color: isActive ? Color.fromRGBO(255, 70, 86, 1) : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
