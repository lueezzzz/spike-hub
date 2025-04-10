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
        color: Color(0xFF1F2326),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/valorant-logo.png',
                height: 30,
                width: 20,
              ),
              Container(
                color: Colors.white,
                child: Icon(
                  Icons.menu,
                  color: Color(0xFF1F2326),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
