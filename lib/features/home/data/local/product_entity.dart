class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String image;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }
  
  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }
}
