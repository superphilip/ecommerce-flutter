import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';

class GetProductsByCategoryUseCase {
  final ProductsRepository productsRepository;

  GetProductsByCategoryUseCase(this.productsRepository);

  run(int idCategory) {
    return productsRepository.getProductsByCategory(idCategory);
  }
}
