import 'package:easy_vet/features/home/domain/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}