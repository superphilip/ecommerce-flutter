import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';

class UpdateCategoryUseCase {
  CategoriesRepository categoriesRepository;
  UpdateCategoryUseCase(this.categoriesRepository);

  run(int id, Category category, File? file) => categoriesRepository.updateCategory(id, category, file);
}
