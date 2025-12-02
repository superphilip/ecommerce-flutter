import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';

class ImageProductTwoUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  ImageProductTwoUpdate(this.bloc, this.state, this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectOptionImageDialog(context, 
        () => bloc?.add(PickImage(numberFile: 2)),
        () => bloc?.add(TakePhoto(numberFile: 2)));
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child: state.file2 != null 
            ? Image.file(
              state.file2!,
              fit: BoxFit.cover,
            )
            : product != null
            ? FadeInImage.assetNetwork(
              placeholder: 'assets/img/no-image.png', 
              image: product!.image2!,
            )
            : Image.asset(
                'assets/img/no-image.png',
                fit: BoxFit.cover,
              )
            )
          ),
        ),
    );
  }
}