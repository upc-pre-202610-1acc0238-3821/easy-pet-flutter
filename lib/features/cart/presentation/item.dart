import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Image.network(
                item.image,
                width: 64,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(item.category),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                    Text('${item.quantity}'),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
