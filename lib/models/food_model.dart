class Food {
  String id;
  String name;
  int price;
  List<String> tags;
  bool favorite;
  int stars;
  String imageUrl;
  List<String> origins;
  String cookTime;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.tags,
    required this.favorite,
    required this.stars,
    required this.imageUrl,
    required this.origins,
    required this.cookTime,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
  return Food(
    id: json['id'],
    name: json['name'],
    price: json['price']?.toInt() ?? 0, // Convertir a int con un valor predeterminado de 0 en caso de que sea nulo
    tags: List<String>.from(json['tags']),
    favorite: json['favorite'],
    stars: json['stars']?.toInt() ?? 0, // Convertir a int con un valor predeterminado de 0 en caso de que sea nulo
    imageUrl: json['imageUrl'],
    origins: List<String>.from(json['origins']),
    cookTime: json['cookTime'],
  );
}
}
