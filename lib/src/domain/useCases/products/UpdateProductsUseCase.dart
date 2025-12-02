import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';

class UpdateProductsUseCase {
  ProductsRepository repository;
  UpdateProductsUseCase(this.repository);

  run(int id, Product product, List<File>? files) => repository.updateProduct(id, product, files);
}