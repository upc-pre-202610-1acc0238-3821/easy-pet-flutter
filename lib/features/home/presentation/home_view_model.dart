import 'package:easy_vet/core/resource/resource.dart';
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
    final resource = await repository.getProducts();

    switch (resource) {
      case Success<List<Product>>():
        state = state.copyWith(isLoading: false, products: resource.data);
        break;
      case Error<List<Product>>():
        state = state.copyWith(
          isLoading: false,
          errorMessage: resource.message,
        );
        break;
    }
    notifyListeners();
  }
}
