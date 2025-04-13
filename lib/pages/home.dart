import 'package:flutter/material.dart';
import 'package:spike_hub/pages/favorites_page.dart';
import 'package:spike_hub/widgets/bottom_navbar.dart';
import 'package:spike_hub/widgets/feature-widgets/feature_carousel.dart';
import 'package:spike_hub/widgets/search/search_item.dart';
import 'package:spike_hub/widgets/tabs.dart';
import '../widgets/sidebar_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool showAll = false;
  bool isSideMenuOpen = false;
  String activeTab = 'HOME';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                      child: FeatureCarousel(),
                    ),
                  Expanded(
                    child: Tabs(
                      showAll: showAll,
                      onSeeAllChanged: (value) {
                        setState(() {
                          showAll = value;
                        });
                      },
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSideMenuOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSideMenuOpen = false;
                  });
                },
                child: Container(color: Colors.transparent),
              ),
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            right: isSideMenuOpen ? 0 : -200,
            top: 0,
            bottom: 0,
            width: 200,
            child: SidebarMenu(
              activeTab: activeTab,
              onClose: () {
                setState(() {
                  isSideMenuOpen = false;
                });
              },
              onTabSelected: (title) {
                setState(() {
                  activeTab = title;
                  isSideMenuOpen = false;

                  if (title == 'HOME') {
                    showAll = false;
                  } else if (title == "FAVORITES") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritesPage()));
                  } else {
                    showAll = true;
                    switch (title) {
                      case 'AGENTS':
                        _tabController.animateTo(0);
                        break;
                      case 'MAPS':
                        _tabController.animateTo(1);
                        break;
                      case 'WEAPONS':
                        _tabController.animateTo(2);
                        break;
                      case 'GEARS':
                        _tabController.animateTo(3);
                        break;
                    }
                  }
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        isOpen: isSideMenuOpen,
        onMenuToggle: () {
          setState(() {
            isSideMenuOpen = !isSideMenuOpen;
          });
        },
      ),
    );
  }
}
