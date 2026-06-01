import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductRepository repository;

  HomeViewModel({required this.repository}) {
    loadProducts();
  }

  List<Product> products = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      products = await repository.getProducts();
    } catch (e) {
      errorMessage = 'Failed to load products: $e';
    }
    isLoading = false;
    notifyListeners();
  }
}
