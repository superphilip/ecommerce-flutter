import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class ProductsRepository {
  Future<Resource<Product>> createProduct(Product product, List<File> files);
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory);
  Future<Resource<Product>> updateProduct(int id, Product product, List<File>? files);
  Future<Resource<bool>> deleteProduct(int id);
}
