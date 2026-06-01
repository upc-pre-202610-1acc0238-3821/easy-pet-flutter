import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.image, height: 192),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
