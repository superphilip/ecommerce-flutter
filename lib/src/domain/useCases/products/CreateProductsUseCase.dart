import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';

class CreateProductsUseCase {
  ProductsRepository repository;
  CreateProductsUseCase(this.repository);

  run(Product product, List<File> files) => repository.createProduct(product, files);
}