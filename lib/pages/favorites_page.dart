import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/services/favorite_handler.dart';
import 'package:spike_hub/widgets/favorite-widgets/favorite_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoriteHandler fh = FavoriteHandler();
  bool hasChanged = false;

  Future<void> clearAllFavorites() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        title: Text(
          'Clear Favorites',
          style: TextStyle(
            fontFamily: 'AkiraExpanded',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(31, 35, 38, 1),
          ),
        ),
        content: Text(
          'Are you sure you want to remove all favorite agents?',
          style: TextStyle(
            fontFamily: 'FuturaCn',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color.fromRGBO(31, 35, 38, 1),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'DrukWide',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                letterSpacing: 1.2,
                color: Color.fromRGBO(31, 35, 38, 1),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Clear All',
              style: TextStyle(
                fontFamily: 'DrukWide',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                letterSpacing: 1.2,
                color: Color.fromRGBO(255, 70, 86, 1),
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(FavoriteHandler.agentKey);
      setState(() {
        hasChanged = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 86, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, hasChanged),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_left,
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
              const SizedBox(width: 5),
              Text(
                'FAVORITE AGENTS',
                style: const TextStyle(
                  fontFamily: 'DrukWide',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 1.2,
                  color: Color.fromRGBO(248, 248, 248, 1),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep,
                color: Color.fromRGBO(248, 248, 248, 1)),
            tooltip: 'Clear all favorites',
            onPressed: clearAllFavorites,
          ),
        ],
      ),
      body: FutureBuilder<List<Agent>>(
        future: fh.getFavoriteAgents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(248, 248, 248, 0.5),
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontFamily: 'FuturaCn',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(248, 248, 248, 0.7),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the star icon on any agent card to add it to favorites',
                    style: TextStyle(
                      fontFamily: 'FuturaCn',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromRGBO(248, 248, 248, 0.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
                childAspectRatio: 0.7,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final agent = snapshot.data![index];
                return FavoriteCard(
                    agent: agent,
                    onRemove: () {
                      fh.removeAgentFromFave(agent.uuid ?? '');
                      setState(() {
                        hasChanged = true;
                      });
                    });
              },
            );
          }
        },
      ),
    );
  }
}
