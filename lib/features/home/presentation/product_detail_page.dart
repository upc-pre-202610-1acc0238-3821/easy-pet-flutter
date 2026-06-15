import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, required this.product});
  final Product product;

  final ValueNotifier quantity = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              context.read<CartViewModel>().addToCart(
                product.id,
                quantity.value,
              );
            },
            child: const Text('Add to cart'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: product.id, child: Image.network(product.image)),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(product.description),
              Text(
                '\$${product.price.toStringAsFixed(2)} ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (quantity.value > 1) {
                        quantity.value--;
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.remove),
                  ),
                  ValueListenableBuilder(
                    valueListenable: quantity,
                    builder: (context, value, child) {
                      return SizedBox(
                        width: 16,
                        child: Center(child: Text(value.toString())),
                      );
                    },
                  ),
                  OutlinedButton(
                    onPressed: () {
                      quantity.value++;
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),

                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
