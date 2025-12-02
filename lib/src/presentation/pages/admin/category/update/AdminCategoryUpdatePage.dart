import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/AdminCategoryUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminCategoryUpdatePage extends StatefulWidget {
  const AdminCategoryUpdatePage({super.key});

  @override
  State<AdminCategoryUpdatePage> createState() => _AdminCategoryUpdatePageState();
}

class _AdminCategoryUpdatePageState extends State<AdminCategoryUpdatePage> {
  Category? category;
  AdminCategoryUpdateBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.add(AdminCategoryUpdateInitEvent(category: category));
    });
  }

  @override
  void dispose() {
    _bloc?.add(AdminCategoryUpdateReset());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCategoryUpdateBloc>(context);
    category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      body: BlocListener<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            Future.delayed(Duration(seconds: 2), () {
              context.read<AdminCategoryListBloc>().add(GetCategories());
            });
            Fluttertoast.showToast(
              msg: 'Categoria actualizada correctamente',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: BlocBuilder<AdminCategoryUpdateBloc, AdminCategoryUpdateState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AdminCategoryUpdateContent(_bloc, state, category),
                  Center(child: CircularProgressIndicator(color: Colors.black)),
                ],
              );
            }
            return AdminCategoryUpdateContent(_bloc, state, category);
          },
        ),
      ),
    );
  }
}
