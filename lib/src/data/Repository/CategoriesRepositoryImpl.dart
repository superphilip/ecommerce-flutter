import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/categoriesService/CategoriesService.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesService categoriesService;
  SharedPref sharedPref;

  CategoriesRepositoryImpl(this.categoriesService, this.sharedPref);

  @override
  Future<Resource<Category>> createCategory(Category category, File file) async {
    return categoriesService.create(category, file);
  }
  
  @override
  Future<Resource<List<Category>>> getCategories() {
    return categoriesService.getCategories();
  }
  
  @override
  Future<Resource<Category>> updateCategory(int id, Category category, File? file) {
    return categoriesService.update(id, category, file);
  }
  
  @override
  Future<Resource<bool>> deleteCategory(int id) {
    return categoriesService.delete(id);
  }
}