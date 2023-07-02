class FoodModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> tags;

  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      tags: (json['tags'] as List<dynamic>).map((tag) => tag as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'tags': tags,
    };
  }
}
