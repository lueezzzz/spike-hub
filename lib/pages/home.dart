import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/custom_search_bar.dart';
import 'package:spike_hub/widgets/tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 86, 1),
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(),
            if (!showAll) const SizedBox(height: 275),
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(31, 35, 38, 1),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 7.0),
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/valorant-logo.png'),
                          fit: BoxFit.contain)),
                )),
            SizedBox(
              child: Icon(
                Icons.menu,
                color: Color.fromRGBO(248, 248, 248, 1),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
