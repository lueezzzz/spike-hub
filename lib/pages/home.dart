import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/custom_search_bar.dart';
import 'package:spike_hub/widgets/tabs.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(),
        Expanded(child: Tabs()),
      ],
    );
  }
}
