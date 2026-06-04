import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.image),
            Text(product.name),
            Text('\$${product.price.toStringAsFixed(2)} '),
          ],
        ),
      ),
    );
  }
}
