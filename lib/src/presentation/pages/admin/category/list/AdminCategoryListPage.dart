import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/AdminCategoryListItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminCategoryListPage extends StatefulWidget {
  const AdminCategoryListPage({super.key});

  @override
  State<AdminCategoryListPage> createState() => _AdminCategoryListPageState();
}

class _AdminCategoryListPageState extends State<AdminCategoryListPage> {
  AdminCategoryListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.add(const GetCategories());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminCategoryListBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () =>
            Navigator.pushNamed(context, AppRouter.adminCategoryCreateRoute),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocListener<AdminCategoryListBloc, AdminCategoryListState>(
        listener: (context, state) {
          final responseState = state.response;
          if(responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(const GetCategories());
            }
          } else
          if (responseState is Error) {
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
        child: BlocBuilder<AdminCategoryListBloc, AdminCategoryListState>(builder: (context, state) {
          final responseState = state.response;
          if (responseState is Loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (responseState is Success) {
            final categories = responseState.data;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return AdminCategoryListItem(_bloc, category);
              },
            );
          } else {
            return const Center(
              child: Text('No se pudieron cargar las categorías'),
            );
          }
        })
      ),
    );
  }
}
