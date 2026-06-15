import 'package:easy_vet/features/home/data/local/product_dao.dart';
import 'package:easy_vet/features/home/data/local/product_entity.dart';
import 'package:easy_vet/features/home/data/remote/product_dto.dart';
import 'package:easy_vet/features/home/data/remote/product_service.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;
  final ProductDao dao;
  const ProductRepositoryImpl({required this.service, required this.dao});

  @override
  Future<List<Product>> getProducts() async {
    try {
      List<ProductDto> dtos = await service.getProducts();
      for (var dto in dtos) {
        final ProductEntity entity = ProductEntity(
          id: dto.id,
          name: dto.title,
          price: dto.price,
          image: dto.image,
          description: dto.description,
        );
        await dao.insertProduct(entity);
      }

      final List<Product> products = dtos.map((dto) => dto.toDomain()).toList();
      return products;
    } catch (e) {
      final List<ProductEntity> entities = await dao.getProducts();

      return entities
          .map(
            (entity) => Product(
              id: entity.id,
              name: entity.name,
              price: entity.price,
              image: entity.image,
              description: entity.description,
            ),
          )
          .toList();
    }
  }
}
