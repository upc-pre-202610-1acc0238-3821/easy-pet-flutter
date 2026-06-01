import 'package:easy_vet/features/home/domain/product.dart';

class HomeState {
  final List<Product> products;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.products = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
