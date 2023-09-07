class Product {
  final String title;
  final double price;
  final String description;
  final String imgUrl;
  final String id;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imgUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      imgUrl: json['imgUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'imgUrl': imgUrl,
    };
  }
}
