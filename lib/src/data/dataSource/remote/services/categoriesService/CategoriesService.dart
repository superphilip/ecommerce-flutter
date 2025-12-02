import 'dart:io';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseService/AbstractHttpClient.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class CategoriesService {
  final AbstractHttpClient client;
  CategoriesService(this.client);

  Future<Resource<Category>> create(Category category, File? file) async {
    final path = 'categories';
    final fields = <String, String>{
      'name': category.name,
      'description': category.description,
    };

    return client.postMultipart<Category>(
      path: path,
      fields: fields,
      files: file != null ? { 'file': file } : null,
      fileMimeType: 'image/jpeg',
      fromJson: (m) => Category.fromJson(m),
    );
  }

  Future<Resource<Category>> update(int id, Category category, File? file) async {
    final path = 'categories/$id';
    final fields = <String, String>{
      'name': category.name,
      'description': category.description,
    };

    return client.putMultipart<Category>(
      path: path,
      fields: fields,
      files: file != null ? { 'file': file } : null,
      fileMimeType: 'image/jpeg',
      fromJson: (m) => Category.fromJson(m),
    );
  }

  Future<Resource<bool>> delete(int id) async {
    final path = 'categories/$id';

    return client.deleteBool(
      path: path,
    );
  }

  Future<Resource<List<Category>>> getCategories() async {
    final path = 'categories';

    return client.getDataList<Category>(
      path: path,
      fromJson: (json) => Category.fromJson(json),
    );
  }
}