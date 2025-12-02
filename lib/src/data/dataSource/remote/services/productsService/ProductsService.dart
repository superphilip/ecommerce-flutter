import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseService/AbstractHttpClient.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class ProductsService {
  final AbstractHttpClient client;
  ProductsService(this.client);

  Future<Resource<Product>> create(Product product, List<File>? images) async {
    final path = 'products';
    final fields = <String, String>{
      'id_category': product.idCategory.toString(),
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
    };

    Map<String, List<File>>? multipleFiles;
    if (images != null && images.isNotEmpty) {
      // El backend espera files[] como nombre del campo para array de archivos
      multipleFiles = {
        'files': images,
      };
    }

    return client.postMultipart<Product>(
      path: path,
      fields: fields,
      multipleFiles: multipleFiles,
      fileMimeType: 'image/jpeg',
      fromJson: (m) => Product.fromJson(m),
    );
  }

  Future<Resource<List<Product>>> getByCategory(int idCategory) async {
    final path = 'products/category/$idCategory';
    return client.getDataList<Product>(
      path: path,
      fromJson: (m) => Product.fromJson(m),
    );
  }

  Future<Resource<Product>> update(int id, Product product, List<File>? images) async {
    final path = 'products/$id';
    final fields = <String, String>{
      'id_category': product.idCategory.toString(),
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
    };

    Map<String, List<File>>? multipleFiles;
    if (images != null && images.isNotEmpty) {
      multipleFiles = {
        'files': images,
      };
    }

    return client.putMultipart<Product>(
      path: path,
      fields: fields,
      multipleFiles: multipleFiles,
      fileMimeType: 'image/jpeg',
      fromJson: (m) => Product.fromJson(m),
    );
  }

  Future<Resource<bool>> delete(int id) async {
    final path = 'products/$id';
    return client.deleteBool(
      path: path,
    );
  }
}
