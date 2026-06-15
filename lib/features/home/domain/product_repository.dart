import 'package:easy_vet/core/resource/resource.dart';
import 'package:easy_vet/features/home/domain/product.dart';

abstract class ProductRepository {
  Future<Resource<List<Product>>> getProducts();
}