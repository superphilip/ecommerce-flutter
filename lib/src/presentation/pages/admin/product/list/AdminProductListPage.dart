import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/AdminProductListItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductListPage extends StatefulWidget {
  const AdminProductListPage({super.key});

  @override
  State<AdminProductListPage> createState() => _AdminProductListPageState();
}

class _AdminProductListPageState extends State<AdminProductListPage> {
  AdminProductListBloc? _bloc;
  Category? category;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _bloc = BlocProvider.of<AdminProductListBloc>(context);
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Category) {
        category = args;
        _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
      } else {
        category = null;
      }
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => Navigator.pushNamed(
          context,
          AppRouter.adminProductCreateRoute,
          arguments: category,
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocListener<AdminProductListBloc, AdminProductListState>(
        listener: (context, state) {
          final responseState = state.response;
          if(responseState is Success) {
            if (responseState.data is bool) {
              if (category != null) {
                _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
              }
            }
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
        child: BlocBuilder<AdminProductListBloc, AdminProductListState>(builder: (context, state) {
          final responseState = state.response;
          if (responseState is Loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (responseState is Success) {
            final products = responseState.data;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return AdminProductListItem(_bloc, product);
              },
            );
          } else {
            return const Center(
              child: Text('No se pudieron cargar las productos'),
            );
          }
        })
      ),
    );
  }
}
