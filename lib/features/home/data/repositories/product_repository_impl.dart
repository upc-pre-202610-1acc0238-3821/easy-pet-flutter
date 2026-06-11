import 'package:easy_vet/features/home/data/remote/product_dto.dart';
import 'package:easy_vet/features/home/data/remote/product_service.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;
  const ProductRepositoryImpl({required this.service});

  @override
  Future<List<Product>> getProducts() async {
    List<ProductDto> dtos = await service.getProducts();

    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
