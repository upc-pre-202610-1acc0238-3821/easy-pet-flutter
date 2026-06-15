import 'package:easy_vet/core/storage/app_database.dart';
import 'package:easy_vet/features/home/data/local/product_entity.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
  final AppDatabase appDatabase;

  const ProductDao({required this.appDatabase});

  Future<void> insertProduct(ProductEntity entity) async {
    final Database db = await appDatabase.database;

    await db.insert(
      'products',
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAllProducts() async {
    final Database db = await appDatabase.database;
    await db.delete('products');
  }

  Future<List<ProductEntity>> getProducts() async {
    final Database db = await appDatabase.database;
    final List maps = await db.query('products');

    return maps.map((map) => ProductEntity.fromMap(map)).toList();
  }
}
