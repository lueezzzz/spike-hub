import 'package:flutter/material.dart';

class FutureBuildView<T> extends StatelessWidget {
  final Future<List<T>> future;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final bool showAll;
  final int limit;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const FutureBuildView({
    required this.future,
    required this.itemBuilder,
    required this.limit,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    this.showAll = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final items = snapshot.data ?? [];
        final visibleItems = showAll ? items : items.take(limit).toList();

        if (crossAxisCount == 1) {
          return ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            itemCount: visibleItems.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: mainAxisSpacing),
            itemBuilder: (context, index) =>
                itemBuilder(context, visibleItems[index], index),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 40.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          itemCount: visibleItems.length,
          itemBuilder: (context, index) =>
              itemBuilder(context, visibleItems[index], index),
        );
      },
    );
  }
}
