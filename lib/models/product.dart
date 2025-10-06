class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  final String id;
  final String title;
  final int price;
  final String image;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
