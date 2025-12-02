import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';

class ImageCategoryUpdate extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  ImageCategoryUpdate(this.bloc, this.state, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectOptionImageDialog(context, 
        () => bloc?.add(PickImageUpdate()), 
        () => bloc?.add(TakePhotoUpdate()));
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child: state.file != null 
            ? Image.file(
              state.file!,
              fit: BoxFit.cover,
            )
            : category != null 
            ? FadeInImage.assetNetwork(
              placeholder: 'assets/img/user_image.png', 
              image: category!.image!,
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
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