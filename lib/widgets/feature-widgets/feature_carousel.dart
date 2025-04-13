import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/services/favorite_agent_handler.dart';
import 'package:spike_hub/widgets/feature-widgets/feature_card.dart';

class FeatureCarousel extends StatefulWidget {
  const FeatureCarousel({super.key});

  @override
  State<FeatureCarousel> createState() => _FeatureCarouselState();
}

class _FeatureCarouselState extends State<FeatureCarousel> {
  final FavoriteAgentHandler fh = FavoriteAgentHandler();
  List<Map<String, dynamic>> featuresList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFeatures();
  }

  Future<void> loadFeatures() async {
    final features = await fh.loadFeatures();
    setState(() {
      featuresList = features;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 120,
        child: Center(
          child: CircularProgressIndicator(color: Colors.redAccent),
        ),
      );
    }

    if (featuresList.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Text("No features for todae"),
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: CarouselSlider(
          items: featuresList
              .map((feature) => FeatureCard(
                    title: feature['title'],
                    feature: feature['feature'],
                  ))
              .toList(),
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
          )),
    );
  }
}
