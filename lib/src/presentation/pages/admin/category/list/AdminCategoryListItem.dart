import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:flutter/material.dart';

class AdminCategoryListItem extends StatelessWidget {
  AdminCategoryListBloc? bloc;
  Category? category;
  AdminCategoryListItem(this.bloc, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category == null) return;
        Navigator.pushNamed(
          context,
          AppRouter.adminProductListRoute,
          arguments: category,
        );
      },
      child: ListTile(
        leading: category?.image != null
            ? Container(
                width: 55,
                height: 55,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/img/no-image.png',
                      image: category!.image!,
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 1),
                    ),
                  ),
                ),
              )
            : Container(),
        title: Text(category?.name ?? ''),
        subtitle: Text(category?.description ?? ''),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
              onPressed: category == null
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.adminCategoryUpdateRoute,
                        arguments: category,
                      );
                    },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                final id = category?.id;
                if (id != null) {
                  bloc?.add(DeleteCategory(id: id));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No se puede eliminar: categoría inválida')),
                  );
                }
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
