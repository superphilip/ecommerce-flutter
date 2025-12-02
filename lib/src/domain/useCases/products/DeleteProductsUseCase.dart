import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';

class DeleteProductsUseCase {
  final ProductsRepository repository;

  DeleteProductsUseCase(this.repository);

  run(int id) => repository.deleteProduct(id);
}