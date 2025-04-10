class SearchableItem {
  final String id;
  final String name;
  final String type;
  final String iconUrl;
  final dynamic data;
  final String? description;
  final String? parentName;
  final String? subtype;

  SearchableItem({
    required this.id,
    required this.name,
    required this.type,
    required this.iconUrl,
    required this.data,
    this.description,
    this.parentName,
    this.subtype,
  });
}
