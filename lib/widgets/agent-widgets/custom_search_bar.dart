import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              backgroundColor: const WidgetStatePropertyAll<Color>(
                Color(0xFFF8F8F8),
              ),
              keyboardType: TextInputType.text,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 20.0),
              ),
              leading: const Icon(Icons.search),
              hintText: "SEARCH",
              hintStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black,
              )),
              onTap: () => controller.openView(),
              onChanged: (_) => controller.openView(),
              shape: WidgetStatePropertyAll(BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)))),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return <Widget>[];
          },
        ));
  }
}
