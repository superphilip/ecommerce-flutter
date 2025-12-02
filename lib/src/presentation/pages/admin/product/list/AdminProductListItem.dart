import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:flutter/material.dart';

class AdminProductListItem extends StatelessWidget {
  AdminProductListBloc? bloc;
  Product? product;
  AdminProductListItem(this.bloc, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (product == null) return;
        // Navigator.pushNamed(
        //   context,
        //   AppRouter.adminProductListRoute,
        //   arguments: product,
        // );
      },
      child: ListTile(
        leading: product != null
            ? Container(
                width: 55,
                height: 55,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/img/no-image.png',
                      image: product!.image1!,
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 1),
                    ),
                  ),
                ),
              )
            : Container(),
        title: Text(product?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(product?.description ?? ''),
            SizedBox(height: 5),
            Text('\$${product?.price.toString() ?? ''}'),
          ],
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
              onPressed: product == null
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.adminProductUpdateRoute,
                        arguments: product,
                      );
                    },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                final id = product?.id;
                if (id != null) {
                  bloc?.add(DeleteProduct(id: id));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No se puede eliminar: producto inválido')),
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
