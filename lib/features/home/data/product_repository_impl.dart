import 'package:easy_vet/features/home/data/product_dto.dart';
import 'package:easy_vet/features/home/data/product_service.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  final ProductService service = ProductService();

  @override
  Future<List<Product>> getProducts() async {
    
    List<ProductDto> dtos = await service.getProducts();

    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
