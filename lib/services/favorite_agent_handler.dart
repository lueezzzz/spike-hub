import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

class FavoriteAgentHandler {
  final Random ran = Random();

  Future<List<Map<String, dynamic>>> loadFeatures() async {
    final List<Map<String, dynamic>> features = [];

    try {
      final jsonString =
          await rootBundle.loadString('assets/data/features.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      List<dynamic> facts = jsonData['facts'];
      facts.shuffle();

      for (var fact in facts.take(10)) {
        features.add({
          'title': 'Valorant Fact',
          'feature': fact['text'],
        });
      }
    } catch (e) {
      print('Err: $e');
    }

    return features;
  }
}
