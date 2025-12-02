import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';

class ImageProductTwo extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  ImageProductTwo(this.bloc, this.state, {super.key});
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