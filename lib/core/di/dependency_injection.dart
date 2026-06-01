import 'package:easy_vet/features/home/data/product_repository_impl.dart';
import 'package:easy_vet/features/home/data/product_service.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ProductService>(() => ProductService());

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(service: getIt<ProductService>()),
  );

  getIt.registerFactory(
    () => HomeViewModel(repository: getIt<ProductRepository>()),
  ); // Register services, repositories, etc. here
}
