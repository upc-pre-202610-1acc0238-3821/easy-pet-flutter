import 'package:easy_vet/features/home/data/product_repository_impl.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/presentation/product_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    List<Product> products = await ProductRepositoryImpl().getProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) => ProductItem(product: _products[index]),
    );
  }
}
