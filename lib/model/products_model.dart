class Products {
  final String title;
  final String description;
  final int price;
  final String thumbnail;

  Products({
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
