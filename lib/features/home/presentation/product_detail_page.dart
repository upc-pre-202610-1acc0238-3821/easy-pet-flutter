import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              context.read<CartViewModel>().addToCart(product.id, 1);
            },
            child: const Icon(Icons.add_shopping_cart),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: product.id, child: Image.network(product.image)),
            Text(product.name),
            Text('\$${product.price.toStringAsFixed(2)} '),
          ],
        ),
      ),
    );
  }
}
