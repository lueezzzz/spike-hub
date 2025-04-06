import 'package:flutter/material.dart';

class FutureGridview<T> extends StatelessWidget {
  final Future<List<T>> future;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const FutureGridview({
    required this.future,
    required this.itemBuilder,
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

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 4,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) =>
              itemBuilder(context, items[index], index),
        );
      },
    );
  }
}
