import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductRepository repository;

  HomeViewModel({required this.repository}) {
    loadProducts();
  }

  HomeState state = HomeState();

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();
    try {
      final List<Product> products = await repository.getProducts();
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load products: $e',
      );
    }
    notifyListeners();
  }
}
