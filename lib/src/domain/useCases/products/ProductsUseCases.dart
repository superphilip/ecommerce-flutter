import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductsUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/DeleteProductsUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/UpdateProductsUseCase.dart';

class ProductsUseCases {
  CreateProductsUseCase create;
  GetProductsByCategoryUseCase getProductsByCategory;
  UpdateProductsUseCase update;
  DeleteProductsUseCase delete;

  ProductsUseCases({required this.create, required this.getProductsByCategory, required this.update, required this.delete});
}
