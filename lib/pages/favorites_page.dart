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

  Future<void> clearAllFavorites() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Favorites'),
        content: Text('Are you sure you want to remove all favorite agents?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Clear All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(FavoriteHandler.agentKey);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 86, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'FAVORITE AGENTS',
          style: TextStyle(
            color: Color.fromRGBO(248, 248, 248, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(248, 248, 248, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                    color: Color.fromRGBO(255, 70, 86, 0.5),
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      color: Color.fromRGBO(248, 248, 248, 0.7),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the star icon on any agent card to add it to favorites',
                    style: TextStyle(
                      color: Color.fromRGBO(248, 248, 248, 0.5),
                      fontSize: 14,
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
                      setState(() {});
                    });
              },
            );
          }
        },
      ),
    );
  }
}
